require 'rubygems'  
require "active_record"

ActiveRecord::Base.establish_connection(  
:adapter => "mysql2",  
:host => "127.0.0.1",  
:database => "students",  
:password=> '1', 
:username => 'root'				       
)  
  
class Mkauth < ActiveRecord::Base  
	def self.table_name
		"rubyists"
	end
end  

Mkauth.create(:name => 'Luc Juggery', :city => "Nashville, Tenessee") 

mk = Mkauth.first   
puts %{#{mk.name}}  


class User < ActiveRecord::Base
	establish_connection  adapter: 'postgresql', host: 'localhost', username: 'postgres', password: 'postradius', port: 5432, database: 'app_development'
end

puts User.first.name
