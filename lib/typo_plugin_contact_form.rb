# TypoPluginContactForm
%w{ models controllers helpers }.each do |dir|
  path = File.join(File.dirname(__FILE__), 'app', dir)
  $LOAD_PATH << path
  ActiveSupport::Dependencies.load_paths << path
  ActiveSupport::Dependencies.load_once_paths.delete(path)
end

unless ContactForm.table_exists?
  ActiveRecord::Schema.create_table(ContactForm.table_name) do |t|
    t.column :name,           :string
    t.column :email,          :string
    t.column :address,        :string
    t.column :message,        :text
    t.column :created_at,     :datetime
    t.column :updated_at,     :datetime
  end
  
#  admin = Profile.find_by_label('admin')
#  admin.modules << :contactform
#  admin.save  
end

#ActionController::Base.send :helper, ContactFormHelper