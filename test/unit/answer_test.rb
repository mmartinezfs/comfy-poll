require File.expand_path('../test_helper', File.dirname(__FILE__))

class AnswerTest < ActiveSupport::TestCase
  
  def test_fixtures_validity
    Poll::Answer.all.each do |answer|
      assert answer.valid?, answer.errors.full_messages.to_s
    end
  end
  
  def test_validations
    answer = Poll::Answer.new
    assert answer.invalid?
    assert_has_errors_on answer, [:question_id, :option_id]
  end
  
  def test_validation_inclusion
    answer = poll_questions(:default).answers.build(:option_id => '99')
    assert answer.invalid?
    assert_has_errors_on answer, [:option_id]
  end
  
  def test_creation
    question = poll_questions(:default)
    assert_difference 'Poll::Answer.count' do
      question.answers.create!(
        :option_id  => question.options.keys.first
      )
    end
  end
  
end
