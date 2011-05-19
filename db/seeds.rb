Role.destroy_all
User.destroy_all
Blog.destroy_all
Post.destroy_all

role_names = %w(admin user guest manager moderator)
user_names = Tools::NameGenerator.generate 100, 3, 9

role_names.each do |name|
  Role.create(:name => name)
end

user_names.each do |name|
  User.create(:username => name, :email => "#{name.downcase}@example.com")
end

