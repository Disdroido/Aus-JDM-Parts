desc "populate roles"
task :populate_roles => :environment do
    Role.where(code: 'default').first_or_create.update(name: 'Default')
    Role.where(code: 'moderator').first_or_create.update(name: 'Moderator')
    Role.where(code: 'admin').first_or_create.update(name: 'Admin')
end

desc "set default role"
task :default_roles => :environment do
    default = Role.find_by(code: 'default')
    moderator = Role.find_by(code: 'moderator')
    admin = Role.find_by(code: 'admin')

    User.update_all(role_id: default.id)
    User.find_by(email: 'admin@ausjdmparts.com').update(role_id: admin.id)
end

desc "role tasks"
task :roles_all => [ :populate_roles, :default_roles ] do
    puts "Finished Role Tasks"
end