require 'faker'

namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    images_path = Rails.root.join('public', 'system')
    
    if Rails.env.development?
      show_spinner('Apagando DB...') { %x(rails db:drop) }
      show_spinner('Criando DB...') { %x(rails db:create) }
      show_spinner('Migrando DB...') { %x(rails db:migrate) }
      
      show_spinner('Cadastrando ADMINISTRADOR PADRÃO...') { %x(rails dev:generate_admin)}
      show_spinner('Faker: Cadastrando ADMINISTRADORES...') { %x(rails dev:generate_admins)}
      show_spinner('Cadastrando USER PADRÃO...') { %x(rails dev:generate_user)}
      show_spinner('Faker: Cadastrando USERS...') { %x(rails dev:generate_users)}
      
      show_spinner('Faker: Cadastrando EVENTOS...') { %x(rails dev:generate_events)}
      show_spinner('Faker: Cadastrando CARDÁPIOS...') { %x(rails dev:generate_menus)}
      show_spinner('Faker: Cadastrando COMENTÁRIOS...') { %x(rails dev:generate_comments)}
    else
      puts 'Você não está em ambiente de desenvolvimento!'
    end
  end
  
  #########################################
  
  desc 'Cria o ADMIN padrão'
  task generate_admin: :environment do
    Admin.create!( 
      email: 'admin@admin.com',
      password: 123456,
      password_confirmation: 123456,
    )
  end
  
  #########################################
  
  desc 'Faker: Cria ADMINS'
  task generate_admins: :environment do
    10.times do
      Admin.create!( 
        email: Faker::Internet.email,
        password: 123456,
        password_confirmation: 123456,
      )
    end
  end
  
  #########################################
  
  desc 'Cria o USER padrão'
  task generate_user: :environment do
    User.create!( 
      email: 'user@user.com',
      password: 123456,
      password_confirmation: 123456,
    )
  end

  #########################################
  
  desc 'Faker: Cria USERS'
  task generate_users: :environment do
    19.times do
      User.create!( 
        email: Faker::Internet.email,
        password: 123456,
        password_confirmation: 123456
      )
    end
  end
  
  #########################################
    
  desc 'Faker: Cria EVENTOS'
  task generate_events: :environment do
    5.times do
      Event.create!( 
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph,
        start: DateTime.now,
        finish: DateTime.now + Random.rand(10)
      )
    end
  end
  
  #########################################
  
  desc 'Faker: Cria CARDÁPIOS'
  task generate_menus: :environment do
    5.times do
      Menu.create!( 
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph,
        price: Random.rand(8),
      )
    end
  end
  
  #########################################

  desc 'Faker: Cria COMENTÁRIOS'
  task generate_comments: :environment do
    Event.all.each do |event|
      (Random.rand(5)).times do
        Comment.create!(
          body: Faker::Lorem.paragraph,
          user: User.all.sample,
          event: event
        )
      end
    end
    
    Menu.all.each do |menu|
      (Random.rand(5)).times do
        Comment.create!(
          body: Faker::Lorem.paragraph,
          user: User.all.sample,
          menu: menu
        )
      end
    end
  end
  
  private
  
  def show_spinner(msg_start, msg_end = 'Concluído!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end