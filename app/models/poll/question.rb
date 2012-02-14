class Poll::Question < ActiveRecord::Base
  
  self.table_name = :poll_questions
  
  serialize :options, Hash
  
  # -- Relationships --------------------------------------------------------
  has_many :answers,
    :dependent => :destroy
    
  # -- Validations ----------------------------------------------------------
  validates :title, :identifier, :content, :options,
    :presence => true
  
end