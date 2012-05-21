# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
User.delete_all
user1 = User.create!(:name=>"matthew_liu", :real_name=>"qingbo.liu", :email=>"qingbo_matthew@163.com",
        :password=>"198612", :password_confirmation=>"198612")
user_operator = User.create!(:name=>"operator", :real_name=>"system_operator_A", :email=>"qingbo_matthew@163.com",
        :password=>"123456", :password_confirmation=>"123456")
user_admin = User.create!(:name=>"admin", :real_name=>"admin_operator_A", :email=>"qingbo_matthew@163.com",
        :password=>"123456", :password_confirmation=>"123456")
user_finance = User.create!(:name=>"finance", :real_name=>"finance_operator_A", :email=>"qingbo_matthew@163.com",
        :password=>"123456", :password_confirmation=>"123456")
user_sale = User.create!(:name=>"sale", :real_name=>"sale_operator_A", :email=>"qingbo_matthew@163.com",
        :password=>"123456", :password_confirmation=>"123456")


Role.delete_all
operator = Role.create!(:name=>"operator")
admin = Role.create!(:name=>"admin")
finance = Role.create!(:name=>"finance");
sale = Role.create!(:name=>"sale")

user1.roles << operator
user1.roles << admin
user1.roles << finance
user1.roles << sale

user_operator.roles << operator
user_admin.roles << admin
user_finance.roles << finance
user_sale.roles << sale




Right.delete_all
notices_create = Right.create!(:resource => "notices", :operation => "CREATE")
notices_read = Right.create!(:resource => "notices", :operation => "READ")
notices_update = Right.create!(:resource => "notices", :operation => "UPDATE")
notices_delete = Right.create!(:resource => "notices", :operation => "DELETE")

Role.all.each do |role|
  role.rights << notices_read
end
admin.rights << notices_create
admin.rights << notices_update
admin.rights << notices_delete

users_create = Right.create!(:resource => "users", :operation => "CREATE")
users_read = Right.create!(:resource => "users", :operation => "READ")
users_update = Right.create!(:resource => "users", :operation => "UPDATE")
users_delete = Right.create!(:resource => "users", :operation => "DELETE")
operator.rights << users_create
operator.rights << users_read
operator.rights << users_update
operator.rights << users_delete


roles_create = Right.create!(:resource => "roles", :operation => "CREATE")
roles_read = Right.create!(:resource => "roles", :operation => "READ")
roles_update = Right.create!(:resource => "roles", :operation => "UPDATE")
roles_delete = Right.create!(:resource => "roles", :operation => "DELETE")
operator.rights << roles_create
operator.rights << roles_read
operator.rights << roles_update
operator.rights << roles_delete






