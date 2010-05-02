require 'porter' unless defined? Porter

Porter.configure do |config|
  config.admin_prefix = 'admin'
  config.table_name_prefix = 'porter_'
end