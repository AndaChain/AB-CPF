require 'rails_helper'

RSpec.feature "login", type: :feature do
    describe 'login page' do
        it 'shows the right content' do
            visit login_path
            within('form') do
                fill_in 'user_name', with: 'm1'
                fill_in 'password', with: '1230'
            end
            click_button 'Log in'
            expect(page).to have_content('Welcome to Time Attendance')
        end
    end
end