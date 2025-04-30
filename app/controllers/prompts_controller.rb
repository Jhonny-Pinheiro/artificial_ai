class PromptsController < ApplicationController
  def new
    @prompt = Prompt.new
  end

  def create
  end
end
