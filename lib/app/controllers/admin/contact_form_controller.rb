module Admin; end
class Admin::ContactFormController < Admin::BaseController
  unloadable
  layout :set_layout
  before_filter :template_root
  
  def template_root
    self.view_paths = ::ActionController::Base.view_paths.dup.unshift("#{RAILS_ROOT}/vendor/plugins/typo_plugin_contact_form/lib/app/views")
  end
  
  def set_layout
    "#{RAILS_ROOT}/app/views/layouts/administration.html.erb"
  end
  
  def index
    @messages = ContactForm.find(:all)
  end
  
  
end