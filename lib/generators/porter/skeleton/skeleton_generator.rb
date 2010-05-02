require 'generators/porter'

module Porter
  module Generators
    ####
    # == Skeleton Generator
    #
    #   rails porter:skeleton [options]
    #
    # === Description
    # The porter skeleton generator creates a basic layout, stylesheet and
    # helper which will give some structure to a starting Rails app.
    #
    # === Options
    # <tt>[--skip-compass]</tt>::
    #   Don't generate COMPASS related files (do this only if you really know what you are doing)
    # <tt>[--table-name-prefix=TABLE_NAME_PREFIX]</tt>::
    #  The SQL table name prefix for porter as string
    #
    #  Default: <tt>porter_</tt>
    # <tt>[--admin-prefix=ADMIN_PREFIX]</tt>::
    #   The prefix for porter admin controllers as string
    #
    #   Default: <tt>admin</tt>
    #
    # === Runtime options
    # <tt>-q, [--quiet]</tt>:: Supress status output
    # <tt>-p, [--pretend]</tt>:: Run but do not make any changes
    # <tt>-s, [--skip]</tt>:: Skip files that already exist
    # <tt>-f, [--force]</tt>:: Overwrite files that already exist
    #
    # === Examples
    #   rails generate porter:skeleton
    
    class SkeletonGenerator < Base
      class_option :admin_prefix, :desc => 'The prefix for porter admin controllers as string', :group => 'Porter config', :type => :string, :default => Porter::config.admin_prefix
      class_option :table_name_prefix, :desc => 'The SQL table name prefix for porter as string', :group => 'Porter config', :type => :string, :default => Porter::config.table_name_prefix
	
      def create_skeleton # :nodoc:      
        template 'initializer.rb', "config/initializers/porter.rb"
      end
    
      private
      
      def file_name
        layout_name.underscore
      end
    end
  end
end
