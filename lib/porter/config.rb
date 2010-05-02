module Porter
  ####
  # Porter::Config is responsible for holding and managing the configuration
  # for your Porter Rails Application.
  #
  # Possible configuration options are:
  # +table_name_prefix+:: 
  #    The prefix for the SQL tables
  #
  #    The default value is <tt>"porter_"</tt>
  # +admin_prefix+::      
  #    The prefix for the admin controllers
  #
  #    The default value is <tt>"admin"</tt>

  class Config 
    attr_writer :table_name_prefix, :admin_prefix # :nodoc:
    attr_writer :compass_format # :nodoc:
    
    def initialize(&block) #:nodoc:
      configure(&block) if block_given?
    end

    # Configure your Porter Rails Application with the given parameters in 
    # the block. For possible options see above.
    def configure(&block)
      yield(self)
    end
    
    def table_name_prefix #:nodoc:
      @table_name_prefix ||= 'porter_'
    end
    
    def admin_prefix #:nodoc:
      @admin_prefix.blank? ? 'admin' : @admin_prefix
    end

    def compass_format
      @compass_format ||= 'scss'
    end
    
    def page_formats=(formats) #:nodoc:
      if formats.nil? 
        @page_formats = nil
      elsif formats.class == Array
        @page_formats = formats.map{|l| l.to_sym}
      else
        @page_formats = formats.split(',').collect{|l| l.to_sym}
      end
    end
    
    def page_formats #:nodoc:
      @page_formats ||= [:html]
    end
  end
end