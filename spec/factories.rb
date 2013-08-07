FactoryGirl.define do
  
  factory :question do
    title "Test Title"
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
    best_answer true
    user_id 1
    question_id 1
  end

end
