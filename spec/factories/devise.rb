FactoryBot.define do
    factory :user do
      id {1}
      email {"testuser@testemail.com"}
      password {"abcde12345"}
      # Add additional fields as required via your User model
    end
end