require File.expand_path('../test_helper', File.dirname(__FILE__))

class QuestionTest < ActiveSupport::TestCase
  
  def test_fixtures_validity
    Poll::Question.all.each do |question|
      assert question.valid?, question.errors.full_messages.to_s
      assert question.options.is_a?(Hash)
    end
  end
  
  def test_validations
    question = Poll::Question.new
    assert question.invalid?
    assert_has_errors_on question, [:label, :identifier, :content, :options]
  end
  
  def test_creation
    assert_difference 'Poll::Question.count' do
      options = {
        1 => 'Test Option 1',
        2 => 'Test Option 2'
      }
      question = Poll::Question.create!(
        :label      => 'Test',
        :identifier => 'test',
        :content    => 'Test Poll',
        :options    => options
      )
      question.reload
      assert_equal options, question.options
    end
  end
  
  def test_destruction
    assert_difference ['Poll::Question.count', 'Poll::Answer.count'], -1 do
      poll_questions(:default).destroy
    end
  end
  
  def test_results
    question = poll_questions(:default)
    assert_equal 1, question.answers.for_option(1).count
    assert_equal 0, question.answers.for_option(2).count
  end
  
end
