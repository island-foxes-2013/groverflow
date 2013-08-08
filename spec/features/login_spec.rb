require 'spec_helper'

feature 'log in page' do
  scenario 'user visits the login page' do 
    visit login_path
  end

  scenario 'user logs in' do
    pending
  end
end
