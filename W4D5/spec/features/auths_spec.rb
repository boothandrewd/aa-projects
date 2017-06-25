require 'rails_helper'
require 'spec_helper'

RSpec.feature "Auths", type: :feature do
  feature "the signup process" do

    scenario "has a new user page" do
      visit("/users/new")
    end

    feature "signing up a user" do
      before(:each) do
        visit("/users/new")
        fill_in('username', with: 'ADBOOOOOTH')
        fill_in('password', with: 'hunter12')
        click_on('submit')
      end

      scenario "shows username on the homepage after signup" do
        expect(page).to have_content('ADBOOOOOTH')
      end
    end

  end

  feature "logging in" do
    before(:each) do
      User.create(username: 'ADBOOOOOTH', password: 'hunter12')
      visit("/session/new")
      fill_in('username', with: 'ADBOOOOOTH')
      fill_in('password', with: 'hunter12')
      click_on('submit')
    end

    scenario "shows username on the homepage after login" do
      expect(page).to have_content('ADBOOOOOTH')
    end

  end

  feature "logging out" do

    scenario "begins with a logged out state" do
      
    end

    scenario "doesn't show username on the homepage after logout"

  end
end
