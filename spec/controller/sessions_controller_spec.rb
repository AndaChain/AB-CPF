require 'rails_helper'

RSpec.feature "login", type: :feature do
    before(:each) do
        Department.new(code: 'd1', name: 'Chicken', parent_code: 'd1').save!
        Manager.new(id_m: 'm1', password: '1230', first: 'Manager1', last: 'Last_Manager1', parent_code: "d1").save!
        Employee.new(id_e: "e2", password: "1230", first: "Employee2", last: "Last_Employee2", code: "d1").save!

    end
    describe 'login page' do
        it 'has UserID and password text' do
            visit login_path
            sleep(1)
            expect(page).to have_content('UserID')
            expect(page).to have_content('Password')
        end

        it 'shoud go to manager page if I am manager' do
            visit login_path
            within('form') do
                fill_in 'user_name', with: 'm1'
                fill_in 'password', with: '1230'
            end
            click_button 'Log in'
            expect(current_path).to eql('/manage')
        end

        it 'shoud go to information page if I am employee' do
            visit login_path
            within('form') do
                fill_in 'user_name', with: 'e1'
                fill_in 'password', with: '1230'
            end
            click_button 'Log in'
            expect(current_path).to eql('/infor')
        end

    end
end