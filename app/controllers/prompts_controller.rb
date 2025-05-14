class PromptsController < ApplicationController
  def new
    @prompt = Prompt.new
    @prompts = Prompt.order(created_at: :desc)
  end

  def create
    @prompt = Prompt.new(prompt_params)
    @prompt.answer = OpenaiService.new.chat(@prompt.question)

    if @prompt.save
      redirect_to new_prompt_path    # recarga la página para limpiar el form
    else
      # Si hay error de validación, vuelves a cargar la lista y renderizas
      @prompts = Prompt.order(created_at: :desc)
      render :new
    end
  end

  private
    def prompt_params
      params.require(:prompt).permit(:question)
    end
end