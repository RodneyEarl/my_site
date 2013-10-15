namespace :db do
  desc "Fill the database with an admin."
  task populate: :environment do
    User.create!(name: "Rodney Earl",
                 email: "rsearl.90@gmail.com",
                 password: "Fighter$",
                 password_confirmation: "Fighter$",
                 admin: true)
  end
end
