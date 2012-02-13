class Admin::Poll::QuestionsController < Admin::Poll::BaseController
  
  def index
    @questions = Poll::Question.all
  end
  
end