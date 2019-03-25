namespace :dev do

  DEFAULT_PASSWORD = '321654'
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") {%x(rails db:drop)}
      show_spinner("Criando BD...") {    %x(rails db:create) }
      show_spinner("Migrando BD...") {%x(rails db:migrate) }
      show_spinner("Cadastrando Admin...") {%x(rails dev:add_default_admin) }
      show_spinner("Cadastrando outros Admins...") {%x(rails dev:add_fakers_admins) }
      show_spinner("Cadastrando outros Users...") {%x(rails dev:add_fakers_users) }
      show_spinner("Cadastrando User...") {%x(rails dev:add_default_user) }
      show_spinner("Cadastrando assuntos padrões...") { %x(rails dev:add_subjects) }
      show_spinner("Cadastrando questões testes...") { %x(rails dev:add_questions) }
    else
      puts "Task disponivel apenas para Ambiente de Dev"
    end
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona administradores extra"
  task add_fakers_admins: :environment do
    10.times do |i|
      Admin.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Adiciona usuarios extra"
  task add_fakers_users: :environment do
    10.times do |i|
      User.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Adiciona o usuario padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'admin@admin',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona assuntos padrões"
  task add_subjects: :environment do
    file_name = 'subjects.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Subject.create!(description: line.strip)
    end

  end

  desc "Adiciona perguntas para teste"
  task add_questions: :environment do
    Subject.all.each do |subject|
      rand(5..10).times do |i|
        Question.create!(
          description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
          subject: subject)
      end
    end
  end
  
  private


  def show_spinner(msg_start, msg_end = "Ok")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
  end


end
