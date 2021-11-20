require 'rails_helper'

RSpec.feature "login", type: :feature do
    before(:each) do
        Employee.new(id_e: "e2", password: "1230", first: "Employee2", last: "Last_Employee2", code: "d2").save!
        visit login_path
        within('form') do
            fill_in 'user_name', with: 'e2'
            fill_in 'password', with: '1230'
        end
        click_button 'Log in'
    end
    it 'shoud go to login page if I logout as employee' do
        click_button 'Log out'
        expect(current_path).to eql('/infor')

    end
end