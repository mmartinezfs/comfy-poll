class Poll::Answer < ActiveRecord::Base
  
  self.table_name = :poll_answers
  
  # -- Relationships --------------------------------------------------------
  belongs_to :question
  
  # -- Validations ----------------------------------------------------------
  validates :question_id,
    :presence   => true
  validates :option_id,
    :presence   => true,
    :inclusion  => {
      :in => lambda {|a| 
        (a.question && a.question.options.keys) || [ ]
      }
    }
    
  # -- Scopes ---------------------------------------------------------------
  scope :for_option, lambda {|id|
    where(:option_id => id)
  }
  
end