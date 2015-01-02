# spec/features/user_deletes_meow_for_post_spec.rb

require 'rails_helper'

feature "user deletes a meow for a post", %q{
  As a User
  I want to delete my meow for a post
  So that I can undo my meow if it was an accident
  } do

    # Acceptance Criteria
    # - I must be signed in to delete a meow
    # - I can't delete a meow for a post that I haven't meowed
    # - When I delete a meow, I should see the meow count go down for the post

    let(:user) { FactoryGirl.create(:user) }
    let!(:post) { FactoryGirl.create(:post) }

    scenario "user deletes meow for a post on the root page" do
      FactoryGirl.create(:meow, user: user, post: post)
      sign_in(user)
      visit root_path

      click_on "Remove Meow"

      expect(page).to have_content "0 Meows"
      expect(page).to have_content "All evidence of your meowing has been destroyed!"
    end

    scenario "user does not see button to remove meow from post that they have not meowed" do
      visit root_path
      expect(page).to_not have_content "Remove Meow"
    end
  end
