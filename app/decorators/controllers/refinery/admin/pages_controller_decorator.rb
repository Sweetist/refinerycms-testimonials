Refinery::Admin::PagesController.prepend(
 Module.new do
   def permitted_page_params
     super <<  [:testimonials_show, :testimonials_count, :testimonials_select, :review_ids => []]
    end
 end
)

Refinery::Admin::PagesController.class_eval do
  before_filter :find_testimonials

  protected

    def find_testimonials
      @testimonials = Refinery::Testimonials::Testimonial.all.order('position ASC')
    end
end

