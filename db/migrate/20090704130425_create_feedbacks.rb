class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.string :kind_of_feedback      
      t.text :feedback      
      t.string :page
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacks
  end
end
