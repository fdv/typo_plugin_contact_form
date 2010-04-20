class << ActionController::Routing::Routes;self;end.class_eval do
  define_method :clear!, lambda {}
end

ActionController::Routing::Routes.draw do |map|
  map.connect '/contact_form/:action', :controller => 'contact_form'
  map.connect '/admin/contact_form/:action', :controller => 'admin/contact_form'
end

require 'typo_plugin_contact_form'