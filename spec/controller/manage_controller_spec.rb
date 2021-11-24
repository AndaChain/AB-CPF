require 'rails_helper'

RSpec.feature "login", type: :feature do
    before(:each) do
        Manager.new(id_m: 'm1', password: '1230', first: 'Manager1', last: 'Last_Manager1', parent_code: "p1").save!
        visit login_path
        within('form') do
            fill_in 'user_name', with: 'm1'
            fill_in 'password', with: '1230'
        end
        click_button 'Log in'
    end
    it 'should have Depart Content' do
        expect(page).to have_content('Manage Department')
        
    end

    it 'shoud go to login page if I logout as manager' do
        click_button 'Log out'
        expect(current_path).to eql('/login')
    end

    it 'shoud go to login page if I logout as manager' do    
        find_button(value: 'Edit').click
        expect(current_path).to eql('/manage/d1?')
    end

    it 'check all my employee if I logout as manager' do    
        find_button(value: 'Edit').click
        # expect(current_path).to eql('/manage/d1?')
        check('select-all')
    end 