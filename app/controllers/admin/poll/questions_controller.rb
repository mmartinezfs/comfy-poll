class Admin::Poll::QuestionsController < Admin::Poll::BaseController
  
  before_filter :build_question,  :only => [:new, :create]
  before_filter :load_question,   :only => [:show, :edit, :update, :destroy]
  
  def index
    @questions = ::Poll::Question.all
  end
  
  def show
    render
  end
  
  def new
    render
  end
  
  def edit
    render
  end
  
  def create
    process_options
    @question.save!
    flash[:notice] = 'Poll created'
    redirect_to :action => :index
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Failed to create Poll'
    render :action => :new
  end
  
  def update
    @question.attributes = params[:question]
    process_options
    @question.save!
    flash[:notice] = 'Poll updated'
    redirect_to :action => :index
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Failed to update Poll'
    render :action => :edit
  end
  
  def destroy
    @question.destroy
    flash[:notice] = 'Poll deleted'
    redirect_to :action => :index
  end
  
protected
  
  def build_question
    @question = ::Poll::Question.new(params[:question])
  end
  
  def load_question
    @question = ::Poll::Question.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Poll not found'
    redirect_to :action => :index
  end
  
  def process_options
    options = { }
    (params[:question][:options] || []).reject(&:blank?).each_with_index do |o, i|
      options[i] = o
    end
    @question.options = options
  end
  
end