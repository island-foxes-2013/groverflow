FactoryGirl.define do

  factory :user do
    username {Faker::Internet.user_name}
    email "jesseclay@gmail.com"
    password {"password"}
  end

  factory :question do
    title {Faker::Lorem.sentence}
    content {Faker::Lorem.paragraph}
    user
  end
  
  factory :random_user, class: User do
    username { Faker::Name.first_name }
    email { "mitchel.seaman.junk@gmail.com" }
    password "password"
  end

  factory :answer do
    content "Work the shaft"
    user
    question
    best_answer false
  end

  factory :question_vote, class: Vote do
    association :user, factory: :random_user
    votable { |v| v.association(:question) }
    value 0
  end

  factory :answer_vote, class: Vote do
    association :user, factory: :random_user
    votable { |v| v.association(:answer) }
    value 0
  end

  factory :question_comment, class: Comment do
    association :user, factory: :random_user
    commentable { |c| c.association(:question)}
    content { Faker::Lorem.paragraph }
  end

  factory :answer_comment, class: Comment do
    association :user, factory: :random_user
    commentable { |c| c.association(:answer) }
    content { Faker::Lorem.paragraph }
  end

end
