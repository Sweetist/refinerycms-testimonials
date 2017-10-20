# Open the Refinery::Page model for manipulation

Refinery::Page.class_eval do
  
  has_and_belongs_to_many :reviews, :class_name => '::Refinery::Testimonials::Testimonial', join_table: "refinery_pages_testimonials"

  validates :testimonials_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def testimonials
    if testimonials_show
      n = testimonials_count==0 ? Refinery::Testimonials::Testimonial.count : testimonials_count
      @testimonials = Refinery::Testimonials::Testimonial.all
      if testimonials_select=='Random'
        @testimonials.order_by_rand.limit(n)
      elsif testimonials_select=='Recent'
        @testimonials.order('position').limit(n)
      elsif testimonials_select=='Select'
        @testimonials = self.reviews.order('position').limit(n)
      end
    end
  end
end