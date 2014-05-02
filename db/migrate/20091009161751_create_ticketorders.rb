class CreateTicketorders < ActiveRecord::Migration
  def self.up
    create_table :ticketorders do |t|
      t.integer :ticket_id
      t.integer :user_id        #buyer
      t.integer :vendor_id      #the seller, but the id is connected to the "Users" table.
      t.string :email
      t.integer :nr_of_tickets
      t.string :t1_first_name
      t.string :t1_last_name
      t.integer :t1_age
      t.string :t1_accomodation
      t.string :t1_remark
      t.boolean :t1_vegetarian
      t.boolean :t1_sani
      t.string :t2_first_name
      t.string :t2_last_name
      t.integer :t2_age
      t.string :t2_accomodation
      t.string :t2_remark
      t.integer :t2_vegetarian
      t.integer :t2_sani
      t.string :t3_first_name
      t.string :t3_last_name
      t.integer :t3_age
      t.string :t3_accomodation
      t.string :t3_remark
      t.integer :t3_vegetarian
      t.integer :t3_sani
      t.string :t4_first_name
      t.string :t4_last_name
      t.integer :t4_age
      t.string :t4_accomodation
      t.string :t4_remark
      t.integer :t4_vegetarian
      t.integer :t4_sani
      t.string :t5_first_name
      t.string :t5_last_name
      t.integer :t5_age
      t.string :t5_accomodation
      t.string :t5_remark
      t.integer :t5_vegetarian
      t.integer :t5_sani
      t.string :t6_first_name
      t.string :t6_last_name
      t.integer :t6_age
      t.string :t6_accomodation
      t.string :t6_remark
      t.integer :t6_vegetarian
      t.integer :t6_sani
      t.string :t7_first_name
      t.string :t7_last_name
      t.integer :t7_age
      t.string :t7_accomodation
      t.string :t7_remark
      t.integer :t7_vegetarian
      t.integer :t7_sani
      t.string :t8_first_name
      t.string :t8_last_name
      t.integer :t8_age
      t.string :t8_accomodation
      t.string :t8_remark
      t.integer :t8_vegetarian
      t.integer :t8_sani
      t.string :t9_first_name
      t.string :t9_last_name
      t.integer :t9_age
      t.string :t9_accomodation
      t.string :t9_remark
      t.integer :t9_vegetarian
      t.integer :t9_sani
      t.string :t10_first_name
      t.string :t10_last_name
      t.integer :t10_age
      t.string :t10_accomodation
      t.string :t10_remark
      t.integer :t10_vegetarian
      t.integer :t10_sani
      t.date    :arrival_on
      t.integer :terms_and_conditions
      t.text    :additional_remarks
      t.string  :status #After the entry has been created, what is the status the seller has set? Has the user rated?
      t.string  :step  #Covers the creation and edit steps for validation purposes.
      t.decimal :ticket_price, :precision => 10, :scale => 2, :default => 0
      t.decimal :total_price, :precision => 10, :scale => 2, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :ticketorders
  end
end
