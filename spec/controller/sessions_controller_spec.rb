require 'rails_helper'

RSpec.feature "login", type: :feature do
    describe 'login page' do
        it 'has UserID and password text' do
            visit login_path
            sleep(1)
            expect(page).to have_content('UserID')
            expect(page).to have_content('Password')
        end

        it 'can put username and password' do
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