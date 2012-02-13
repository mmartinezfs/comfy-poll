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
    assert_difference 'Poll::Answer.count' do
      xhr :post, :create, :question_id => poll_questions(:default), :answer => {
        :option_id  => '1'
      }
      assert_response :success
    end
  end
  
  def test_creation_failure
    assert_no_difference 'Poll::Answer.count' do
      xhr :post, :create, :question_id => poll_questions(:default), :answer => { }
      assert_response 422
    end
  end
  
end