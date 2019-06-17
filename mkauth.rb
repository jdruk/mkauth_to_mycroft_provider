require 'rubygems'  
require 'active_record'

class Mk_sis_cliente < ActiveRecord::Base
	def self.table_name
		"sis_cliente"
	end
end 
