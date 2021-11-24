require 'rails_helper'

RSpec.feature "login", type: :feature do
    before(:each) do
        # Department.new(code: "d1", name: "Chicken Cleaner", parent_code: "p1").save!
#         Department.new(code: "d2", name: "Chicken Plucking", parent_code: "p2").save!
#         Department.new(code: "d3", name: "Chicken Processing", parent_code: "p2").save!
#         Department.new(code: "d4", name: "Transport", parent_code: "p1").save!

        # Manager.new(id_m: "m1",password: "1234",first: "Ruth",last: "Noceda",parent_code: "p1").save!
#         Manager.new(id_m: "m2",password: "2468",first: "Iter",last: "Venehim",parent_code: "p2").save!

        Employee.new(id_e: "e1", password: "0000", first: "Rimuru", last: "Tempest", code: "d1").save!
#         Employee.new(id_e: "e2", password: "1111", first: "Nagisa", last: "Tempest", code: "d2").save!
#         Employee.new(id_e: "e3", password: "2222", first: "Anda", last: "Tempest", code: "d2").save!
#         Employee.new(id_e: "e4", password: "3333", first: "Sasaki", last: "Tempest", code: "d1").save!
#         Employee.new(id_e: "e5", password: "4444", first: "Sasako", last: "Tempest", code: "d1").save!
#         Employee.new(id_e: "e6", password: "5555", first: "M.eagles", last: "Tempest", code: "d3").save!
#         Employee.new(id_e: "e7", password: "6666", first: "irina", last: "Tempest", code: "d3").save!
#         Employee.new(id_e: "e8", password: "7777", first: "Chin", last: "Tempest", code: "d4").save!
#         Employee.new(id_e: "e9", password: "8888", first: "Kurumi", last: "Tempest", code: "d4").save!
#         Employee.new(id_e: "e10", password: "9999", first: "Shidou", last: "Tempest", code: "d2").save!

        ShiftTime.new(shifter_code: "s1", start_plan: "00:00", end_plan: "08:00").save!
        ShiftTime.new(shifter_code: "s2", start_plan: "08:00", end_plan: "16:00").save!
        ShiftTime.new(shifter_code: "s3", start_plan: "16:00", end_plan: "00:00").save!
        ShiftTime.new(shifter_code: "s4", start_plan: "00:30", end_plan: "08:30").save!
        ShiftTime.new(shifter_code: "s5", start_plan: "08:30", end_plan: "16:30").save!
        ShiftTime.new(shifter_code: "s6", start_plan: "16:30", end_plan: "00:30").save!

        TimeRecode.new(id_e:"e1").save!
#         TimeRecode.new(id_e:"e2").save!
#         TimeRecode.new(id_e:"e3").save!
#         TimeRecode.new(id_e:"e4").save!
#         TimeRecode.new(id_e:"e5").save!
#         TimeRecode.new(id_e:"e6").save!
#         TimeRecode.new(id_e:"e7").save!
#         TimeRecode.new(id_e:"e8").save!
#         TimeRecode.new(id_e:"e9").save!
#         TimeRecode.new(id_e:"e10").save!

        visit login_path
        within('form') do
            fill_in 'user_name', with: 'e1'
            fill_in 'password', with: '0000'
        end
        click_button 'Log in'
    end
    it 'shoud go to infor page if I logout as employee' do
        # expect(page).to have_content('Sign In Error')
        expect(current_path).to eql('/infor')

    end

    it 'should be in information page' do
        expect(page).to have_content('Information')
        
    end

    it 'shoud go to login page if I logout as employee' do
        click_button 'Log out'
        expect(current_path).to eql('/login')
    end

end