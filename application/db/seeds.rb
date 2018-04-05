# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cadastrando as categorias..."

categories = [ 

        "Animais e acessórios",
        "Esportes",
        "Para a sua casa",
        "Eletrônicos e celulares",
        "Música e Hobbies",
        "Imóveis",
        "Empregos e Negócios",
        "Moda e beleza",
        "Bebês e crianças"
         ]

    categories.each do |category|
        Category.friendly.find_or_create_by(description: category)
    end

puts "Categorias cadastradas com sucesso..."

  puts "Cadastrando Membros..."
    100.times do
    member = Member.new(
              email: Faker::Internet.email, 
              password: "1234",
              password_confirmation: "1234"
                )
            member.build_profile_member
            member.profile_member.first_name = Faker::Name.first_name
            member.profile_member.second_name = Faker::Name.last_name
            member.save!
    end
    puts "Membros Cadastrados com sucesso!!!!"

    #########################

    puts "Cadastrando membro padrão..."
    member = Member.new(
              email: "member33@member.com", 
              password: "member",
              password_confirmation: "member"
                )
            member.build_profile_member
            member.profile_member.first_name = Faker::Name.first_name
            member.profile_member.second_name = Faker::Name.last_name
            member.save!
    puts "Membro padrão cadastrado com sucesso!!!!"

    #########################

    puts "Cadastrando Admin padrão..."
    Admin.create!(
              name: "Administrador Geral",
              email: "admin22@admin.com", 
              password: "admin",
              password_confirmation: "admin",
              role: 0
                )
    puts "Admin padrão cadastrado com sucesso!!!!"

    puts "Cadastrando Anuncios..."
    50.times do
    Ad.create!(
                title: Faker::Lorem.sentence([2,3,4,5].sample),
                description: LeroleroGenerator.paragraph([1,2,3].sample),
                member: Member.all.sample,
                category: Category.all.sample,
                price: "#{Random.rand(500)},#{Random.rand(99)}",
                picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads',"#{Random.rand(9)}.jpg"), 'r'),
                finish_date: Date.today + Random.rand(90) 
                )
    end
    puts "Anuncios Cadastrados com sucesso!!!!"

    ###########################

    puts "Cadastrando comentário Fake..."
    Ad.all.each do |ad|
        (Random.rand(3)).times do
            Comment.create!(
            body: Faker::Lorem.paragraph([1,2,3].sample),
            member: Member.all.sample,
            ad: ad
            )
        end
    end
    puts "Comentários Cadastrados com sucesso!!!!"

    

    