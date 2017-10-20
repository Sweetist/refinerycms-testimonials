class CreatePagesTestimonials < ActiveRecord::Migration
  def change
    create_table :refinery_pages_testimonials, :id => false do |t|
      t.references :page, :null => false
      t.references :testimonial, :null => false
    end
    add_index(:refinery_pages_testimonials, [:page_id, :testimonial_id])
  end
end