class Question
  attr_reader :question
  attr_reader :answer

  def new_question
    n1 = rand(1..20)
    n2 = rand(1..20)
    @question = "What does #{n1} + #{n2} equals to?"
    @answer = n1 + n2
  end
end