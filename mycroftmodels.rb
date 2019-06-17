require 'rubygems'  
require 'active_record'

ActiveRecord::Base.establish_connection(  
	:adapter => "postgresql",  
	:host => "localhost",  
	:database => "app_development",  
	:password=> 'postradius', 
	:username => 'postgres',
	port: 5432				       
) 

class User < ActiveRecord::Base
end

class Address < ActiveRecord::Base
end

class Client < ActiveRecord::Base
end
