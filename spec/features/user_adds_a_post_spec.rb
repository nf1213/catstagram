require "rails_helper"

feature "user adds a post", %q{
  As a User
  I want to make a post
  So that I can share my kitty love with the world
  } do

    # Acceptance Criteria
    # - I must be logged in
    # - I must supply an image
    # - I must upload a image from my computer
    # - I can optionally leave a tweet-length description
    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
      visit new_post_path
    end

    scenario "user adds a post with valid attributes" do
      post = FactoryGirl.build(:post, :with_description)
      # This is the new line where we're using the `attach_file` method from
      # Capybara to simulate uploading a file.
      attach_file 'Image', post.image
      fill_in "Description", with: post.description
      click_on "Create Post"

      expect(page).to have_content "Post created successfully."
    end

    scenario "user adds a post with invalid attributes" do
      click_on "Create Post"

      expect(page).to have_content "There were some errors with your Post."
    end

    scenario "an unauthenticated user tries to add a new post" do
      click_on "Sign Out"
      visit new_post_path
      expect(page).to have_content "You need to sign in or sign up"
    end
  end
