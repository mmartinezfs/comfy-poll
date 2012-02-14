class Poll::Question < ActiveRecord::Base
  
  self.table_name = :poll_questions
  
  serialize :options, Hash
  
  # -- Relationships --------------------------------------------------------
  has_many :answers,
    :dependent => :destroy
    
  # -- Validations ----------------------------------------------------------
  validates :label, :identifier, :content, :options,
    :presence => true
    
  # -- Scopes ---------------------------------------------------------------
  default_scope order('poll_questions.created_at DESC')
  
end