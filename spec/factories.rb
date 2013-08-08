require 'faker'

FactoryGirl.define do
  
  factory :question do
    title {  }
    content "lorem ipsum"
    user_id 1
  end

  factory :user do
    username "grover"
    email "grover@sesamestreet.com"
    password "password"
  end

  factory :answer do
    content "Work the shaft"
    user_id 1
    question_id 1
  end

  factory :invalid_answer, class: Answer do
  end

  factory :fat_test do
    # p Faker::Internet.email
    email {Faker::Internet.email}
  end

  factory :username do
    p Faker::Internet.user_name
    username {Faker::Internet.user_name}
  end

  factory :password do
    password {Faker::Internet.password}
  end

end
