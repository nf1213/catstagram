# spec/features/user_creates_a_meow_for_post_spec.rb

require 'rails_helper'

feature "user creates meow for a post", %q{
  As a User
  I want to create a Meow for a Post
  So that I can tell others that I like the post
  } do

    # Acceptance Criteria
    # - I must be signed in to meow at a post
    # - I should see the current meow count
    # - When I meow, I should see the meow count go up
    # - I cannot Meow at the same Post twice

    let!(:post) { FactoryGirl.create(:post) }

    context "as an authenticated user" do
      before(:each) do
        user = FactoryGirl.create(:user)
        sign_in(user)
        visit root_path
      end

      scenario "user creates a Meow for a Post" do
        click_button "Meow"

        expect(page).to have_content "1 Meow"
        expect(page).to have_content "We heard your Meow!"
      end

      scenario "user cannot Meow a second time at a Post" do
        click_button "Meow"

        expect(page).to_not have_button "Meow", exact: true
      end
    end

    scenario "unauthenticated user cannot create a Meow" do
      visit root_path
      expect(page).to_not have_button "Meow"
    end
  end
