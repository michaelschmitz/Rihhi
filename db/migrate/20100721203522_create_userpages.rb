class CreateUserpages < ActiveRecord::Migration
  def self.up
    create_table :userpages do |t|
      t.integer :user_id
      t.string :name
      t.string :name_p
      t.string :status
      t.string :status_p
      t.string :real_name
      t.string :real_name_p
      t.string :homepage
      t.string :homepage_p
      t.string :region
      t.string :region_p
      t.text :larp_setting
      t.string :larp_setting_p
      t.text :larp_philosophy
      t.string :larp_philosophy_p
      t.text :favorite_characters
      t.string :favorite_characters_p
      t.text :player_group
      t.string :player_group_p
      t.text :homepage_of_group
      t.string :homepage_of_group_p
      t.text :relationship
      t.string :relationship_p
      t.text :about_me
      t.string :about_me_p
      t.text :looking_for
      t.string :looking_for_p
      t.text :contact_me
      t.string :contact_me_p
      t.text :future_cons
      t.string :future_const_p
      t.text :last_cons
      t.string :last_cons_p
      t.text :ask_me_about
      t.string :ask_me_about_p
      t.text :music
      t.string :music_p
      t.text :books
      t.string :books_p
      t.text :movies
      t.string :movies_p
      t.text :other_hobbies
      t.string :other_hobbies_p
      t.text :what_if_ten_days_left
      t.string :what_if_p

      
      t.timestamps
    end
  end

  def self.down
    drop_table :userpages
  end
end
