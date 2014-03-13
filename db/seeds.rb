# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Default admin
admin = CmwAccount.new({ :name => '鹳狸猿', :email => 'bdfzcmw@126.com', :password => 'password', :password_confirmation => 'password'})
admin.role = 'admin'
admin.skip_confirmation!
admin.save!