class ContactFormController < ContentController
  unloadable
  layout :theme_layout
  before_filter :template_root
  
  def template_root
    self.view_paths = ::ActionController::Base.view_paths.dup.unshift("#{RAILS_ROOT}/vendor/plugins/typo_plugin_contact_form/lib/app/views")
  end
  
  def index
    @page_title = "Contact me"

    @message = ContactForm.new

    
    if request.post?
      @message.attributes = params[:contact_form]
      if @message.save
        flash[:notice] = "Thank you very much" 
      else
        flash[:error] = "Ooops something went wrong"
      end
    end
    
  end
end