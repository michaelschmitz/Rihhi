class AddAttachmentsPic1Pic2Pic3AndPic4ToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :pic1_file_name, :string
    add_column :listings, :pic1_content_type, :string
    add_column :listings, :pic1_file_size, :integer
    add_column :listings, :pic1_updated_at, :datetime
    add_column :listings, :pic2_file_name, :string
    add_column :listings, :pic2_content_type, :string
    add_column :listings, :pic2_file_size, :integer
    add_column :listings, :pic2_updated_at, :datetime
    add_column :listings, :pic3_file_name, :string
    add_column :listings, :pic3_content_type, :string
    add_column :listings, :pic3_file_size, :integer
    add_column :listings, :pic3_updated_at, :datetime
    add_column :listings, :pic4_file_name, :string
    add_column :listings, :pic4_content_type, :string
    add_column :listings, :pic4_file_size, :integer
    add_column :listings, :pic4_updated_at, :datetime
  end

  def self.down
    remove_column :listings, :pic1_file_name
    remove_column :listings, :pic1_content_type
    remove_column :listings, :pic1_file_size
    remove_column :listings, :pic1_updated_at
    remove_column :listings, :pic2_file_name
    remove_column :listings, :pic2_content_type
    remove_column :listings, :pic2_file_size
    remove_column :listings, :pic2_updated_at
    remove_column :listings, :pic3_file_name
    remove_column :listings, :pic3_content_type
    remove_column :listings, :pic3_file_size
    remove_column :listings, :pic3_updated_at
    remove_column :listings, :pic4_file_name
    remove_column :listings, :pic4_content_type
    remove_column :listings, :pic4_file_size
    remove_column :listings, :pic4_updated_at
  end
end
