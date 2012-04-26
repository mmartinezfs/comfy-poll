require File.expand_path('../../test_helper', File.dirname(__FILE__))

class Poll::AnswersControllerTest < ActionController::TestCase
  
  def test_get_index
    xhr :get, :index, :question_id => poll_questions(:default)
    assert_response :success
    assert assigns(:question)
  end
  
  def test_get_index_failure
    xhr :get, :index, :question_id => 'invalid'
    assert_response 404
  end
  
  def test_creation
    question = poll_questions(:default)
    assert_difference 'Poll::Answer.count' do
      xhr :post, :create, :question_id => question, :answer => {
        :option_id  => '1'
      }
      assert_response :success
      assert_equal [question.id], session[:comfy_poll_answered_ids]
    end
  end
  
  def test_creation_failure
    assert_no_difference 'Poll::Answer.count' do
      xhr :post, :create, :question_id => poll_questions(:default), :answer => { }
      assert_response 422
      assert_equal nil, session[:comfy_poll_answered_ids]
    end
  end
  
end