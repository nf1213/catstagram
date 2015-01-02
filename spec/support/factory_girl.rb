require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :post do
    image File.open(File.join(Rails.root, '/spec/fixtures/hello_kitty.png'))

    trait :with_description do
      # We use sequence to make sure that each post has a unique description.
      # This makes it easier to test whether or not each post is present on the
      # page.
      sequence(:description) { |n| "Meet kitty#{n}. MEOWWW!" }
    end

    user
  end

  factory :meow do
    user
    post
  end

end
