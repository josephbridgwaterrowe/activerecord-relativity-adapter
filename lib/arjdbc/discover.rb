# arjdbc/discover.rb: Declare ArJdbc.extension modules in this file
# that loads a custom module and adapter.
#require 'arjdbc/jdbc/extension'

module ::ArJdbc
  extension :Relativity do |name|
    puts 'relativity extension'
    if name =~ /relativity/i
      require 'arjdbc/relativity'
      true
    end
  end
end