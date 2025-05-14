require "openai"

class OpenaiService
  def initialize
    @client = OpenAI::Client.new
  end

  def chat(prompt)
    response = @client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [ { role: "user", content: prompt } ],
        temperature: 0.7
      }
    )
    response.dig("choices", 0, "message", "content").to_s.strip
  end
end