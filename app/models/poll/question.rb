class Poll::Question < ActiveRecord::Base
  
  self.table_name = :poll_questions
  
  serialize :options, Hash
  
  # -- Relationships --------------------------------------------------------
  has_many :answers,
    :dependent => :destroy
    
  # -- Validations ----------------------------------------------------------
  validates :question, :options,
    :presence => true
  
end