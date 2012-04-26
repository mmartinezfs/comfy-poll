require File.expand_path('../../../test_helper', File.dirname(__FILE__))

class Admin::Poll::QuestionsControllerTest < ActionController::TestCase
  
  def test_get_index
    get :index
    assert_response :success
    assert_template :index
    assert assigns(:questions)
  end
  
  def test_get_new
    get :new
    assert_response :success
    assert_template :new
    assert_select "form[action='/admin/poll/questions']"
  end
  
  def test_get_show
    get :show, :id => poll_questions(:default)
    assert_response :success
    assert_template :show
    assert assigns(:question)
  end
  
  def test_get_show_failure
    get :edit, :id => 'invalid'
    assert_response :redirect
    assert_redirected_to :action => :index
    assert_equal 'Poll not found', flash[:error]
  end
  
  def test_get_edit
    question = poll_questions(:default)
    get :edit, :id => question
    assert_response :success
    assert_template :edit
    assert assigns(:question)
    assert_select "form[action='/admin/poll/questions/#{question.id}']"
  end
  
  def test_creation
    assert_difference 'Poll::Question.count' do
      post :create, :question => {
        :label      => 'Test',
        :identifier => 'test',
        :content    => 'Test Question',
        :options    => ['Test Option 1', 'Test Option 2']
      }
      assert_response :redirect
      assert_redirected_to :action => :index
      assert_equal 'Poll created', flash[:notice]
    end
  end
  
  def test_creation_failure
    assert_no_difference 'Poll::Question.count' do
      post :create, :question => { }
      assert_response :success
      assert_template :new
      assert_equal 'Failed to create Poll', flash[:error]
    end
  end
  
  def test_update
    question = poll_questions(:default)
    put :update, :id => question, :question => {
      :content => 'Updated Question',
      :options    => ['Test Option 1', 'Test Option 2']
    }
    assert_response :redirect
    assert_redirected_to :action => :index
    assert_equal 'Poll updated', flash[:notice]
    
    question.reload
    assert_equal 'Updated Question', question.content
  end
  
  def test_update_failure
    question = poll_questions(:default)
    put :update, :id => question, :question => {
      :content => ''
    }
    assert_response :success
    assert_template :edit
    assert_equal 'Failed to update Poll', flash[:error]
    
    question.reload
    assert_not_equal '', question.content
  end
  
  def test_destroy
    assert_difference 'Poll::Question.count', -1 do
      delete :destroy, :id => poll_questions(:default)
      assert_response :redirect
      assert_redirected_to :action => :index
      assert_equal 'Poll deleted', flash[:notice]
    end
  end
  
end