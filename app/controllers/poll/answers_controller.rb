class Poll::AnswersController < ApplicationController
  
  before_filter :load_question
  
  def index
    render
  end
  
  def create
    @answer = @question.answers.new(params[:answer])
    @answer.save!
    session[:comfy_poll_answered_ids] ||= []
    session[:comfy_poll_answered_ids] << @question.id
  rescue ActiveRecord::RecordInvalid
    render :nothing => true, :status => 422
  end
  
protected
  
  def load_question
    @question = Poll::Question.find(params[:question_id])
  rescue ActiveRecord::RecordNotFound
    render :nothing => true, :status => 404
  end
  
end
