class ActiveRecord::Base
  class << self
    def relativity_connection( config )
      config[:port] ||= 1583
      config[:url] ||= "jdbc:relativity://#{config[:host]}:#{config[:port]}/#{ config[:database]}"
      config[:driver] ||= 'relativity.jdbc.Driver'
      config[:adapter_spec] ||= ::ArJdbc::Relativity
      config[:adapter_class] = ActiveRecord::ConnectionAdapters::RelativityAdapter unless config.key?(:adapter_class)
      if config.key?(:adapter_class) && config[:adapter_class].class == String
        config[:adapter_class] = config[:adapter_class].constantize
      elsif config.key?(:adapter_class)
        config[:adapter_class] = config[:adapter_class]
      else
        config[:adapter_class] = ActiveRecord::ConnectionAdapters::RelativityAdapter
      end

      jdbc_connection(config)
    end
  end
end
