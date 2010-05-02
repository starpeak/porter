require 'porter' unless defined? Porter

Porter.configure do |config|
  config.admin_prefix = '<%= options[:admin_prefix] %>'
  config.table_name_prefix = '<%= options[:table_name_prefix] %>'
end