class AnswersController < ApplicationController
  before_action :set_question

  def create
    @question.answers.create! answers_params
    redirect_to @question
  end

  def destroy
    @question.answers.destroy params[:id]
    redirect_to @question
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answers_params
    params.required(:answer).permit(:content)
  end
end