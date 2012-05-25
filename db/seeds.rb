# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#encoding: utf-8
User.delete_all
Notice.delete_all
user1 = User.create!(:name=>"matthew_liu", :real_name=>I18n.t("init_data.user.name1"), :email=>"qingbo_matthew@163.com",
        :password=>"198612", :password_confirmation=>"198612")
user_operator = User.create!(:name=>"operator", :real_name=>I18n.t("init_data.user.name2"), :email=>"qingbo_matthew@163.com",
        :password=>"123456", :password_confirmation=>"123456")
user_admin = User.create!(:name=>"admin", :real_name=>I18n.t("init_data.user.name3"), :email=>"qingbo_matthew@163.com",
        :password=>"123456", :password_confirmation=>"123456")
user_finance = User.create!(:name=>"finance", :real_name=>I18n.t("init_data.user.name4"), :email=>"qingbo_matthew@163.com",
        :password=>"123456", :password_confirmation=>"123456")
user_sale = User.create!(:name=>"sale", :real_name=>I18n.t("init_data.user.name5"), :email=>"qingbo_matthew@163.com",
        :password=>"123456", :password_confirmation=>"123456")


Role.delete_all
operator = Role.create!(:name=>I18n.t("init_data.role.operator"))
admin = Role.create!(:name=>I18n.t("init_data.role.admin"))
finance = Role.create!(:name=>I18n.t("init_data.role.finance"));
sale = Role.create!(:name=>I18n.t("init_data.role.sale"))
normal_user = Role.create!(:name=>I18n.t("init_data.role.normal_user"))

user1.roles << operator
user1.roles << admin
user1.roles << finance
user1.roles << sale
user1.roles << normal_user

user_operator.roles << operator
user_admin.roles << admin
user_finance.roles << finance
user_sale.roles << sale

Position.delete_all
staff = Position.create!(:name=>I18n.t("init_data.position.staff"))
project_manager = Position.create!(:name=>I18n.t("init_data.position.project_manager"))
department_manager = Position.create!(:name=>I18n.t("init_data.position.department_manager"))
vice_president = Position.create!(:name=>I18n.t("init_data.position.vice_president"))
president = Position.create!(:name=>I18n.t("init_data.position.president"))


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

communicate_msgs = []
communicate_msgs << Right.create!(:resource => "communicate_msgs", :operation => "CREATE")
communicate_msgs <<  Right.create!(:resource => "communicate_msgs", :operation => "READ")
communicate_msgs <<  Right.create!(:resource => "communicate_msgs", :operation => "UPDATE")
communicate_msgs << Right.create!(:resource => "communicate_msgs", :operation => "DELETE")
communicate_msgs.each do|communicate_msg|
  Role.all.each do|role|
    role.rights << communicate_msg
  end
end










