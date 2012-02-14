class CreateComfyPoll < ActiveRecord::Migration
  
  def self.up
    create_table :poll_questions do |t|
      t.string :title,      :null => false
      t.string :identifier, :null => false
      t.string :content,    :null => false
      t.text :options
      t.timestamps
    end
    add_index :poll_questions, :identifier
    
    create_table :poll_answers do |t|
      t.integer :question_id, :null => false
      t.integer :option_id,   :null => false
      t.string :other
      t.timestamps
    end
    add_index :poll_answers, [:question_id, :option_id]
  end
  
  def self.down
    drop_table :poll_questions
    drop_table :poll_answers
  end
  
end