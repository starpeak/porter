####
# Welcome to Porter

module Porter
  # This is the actual version of the Porter gem
  VERSION = ::File.read(::File.join(::File.dirname(__FILE__), "..", "VERSION")).strip  
    
  def self.load options = {} #:nodoc:
    require ::File.expand_path('../porter/rake_tasks', __FILE__)
  end
  
  # This is the path to the Porter gem's root directory
  def base_directory
    ::File.expand_path(::File.join(::File.dirname(__FILE__), '..'))
  end
  
  # This is the path to the Porter gem's lib directory
  def lib_directory
    ::File.expand_path(::File.join(::File.dirname(__FILE__)))
  end
    
  module_function :base_directory, :lib_directory

  class << self    
    # To access the actual configuration of your Porter, you can call this.
    #
    # An example would be <tt>Porter.config.www_prefix = 'cms/:locale/'</tt>
    #
    # See Porter::Config for configuration options.
    def config
      @config ||= Porter::Config.new
    end

    # Configure the Porter 
    # See Porter::Config.configure for details
    def configure(&block)
      config.configure(&block)
    end
  end
end

require File.expand_path('../porter/config', __FILE__)
require File.expand_path('../porter/engine', __FILE__)
require File.expand_path('../porter/compass', __FILE__)

require 'i18n'
I18n.load_path += Dir.glob("#{File.dirname(__FILE__)}/../config/locales/*.yml")
puts "=> #{I18n.t 'porter.start', :version => Porter::VERSION}"

#require File.expand_path('../porter/action_controller/base', __FILE__)
#require File.expand_path('../porter/active_record/acts/user', __FILE__)

