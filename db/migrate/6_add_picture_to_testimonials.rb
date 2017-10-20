class AddPictureToTestimonials < ActiveRecord::Migration
  def change
    add_column :refinery_testimonials, :picture_id, :integer
  end
end
