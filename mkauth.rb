require 'rubygems'  
require 'active_record'

ActiveRecord::Base.establish_connection(  
	:adapter => "mysql2",  
	:host => "172.31.255.2",  
	:database => "mkradius",  
	:password=> 'vertrigo', 
	:username => 'root'				       
) 

class Mk_sis_cliente < ActiveRecord::Base  
	def self.table_name
		"sis_cliente"
	end
end 