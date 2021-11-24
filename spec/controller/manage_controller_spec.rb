require 'rails_helper'

RSpec.feature "login", type: :feature do

    before(:each) do
        Department.new(code: "d1", name: "Chicken Cleaner", parent_code: "p1").save!
        # Department.new(code: "d2", name: "Chicken Plucking", parent_code: "p2").save!
        # Department.new(code: "d3", name: "Chicken Processing", parent_code: "p2").save!
        # Department.new(code: "d4", name: "Transport", parent_code: "p1").save!

        Manager.new(id_m: "m1",password: "1234",first: "Ruth",last: "Noceda",parent_code: "p1").save!
        # Manager.new(id_m: "m2",password: "2468",first: "Iter",last: "Venehim",parent_code: "p2").save!

        Employee.new(id_e: "e1", password: "0000", first: "Rimuru", last: "Tempest", code: "d1").save!
        # Employee.new(id_e: "e2", password: "1111", first: "Nagisa", last: "Tempest", code: "d2").save!
        # Employee.new(id_e: "e3", password: "2222", first: "Anda", last: "Tempest", code: "d2").save!
        # Employee.new(id_e: "e4", password: "3333", first: "Sasaki", last: "Tempest", code: "d1").save!
        # Employee.new(id_e: "e5", password: "4444", first: "Sasako", last: "Tempest", code: "d1").save!
        # Employee.new(id_e: "e6", password: "5555", first: "M.eagles", last: "Tempest", code: "d3").save!
        # Employee.new(id_e: "e7", password: "6666", first: "irina", last: "Tempest", code: "d3").save!
        # Employee.new(id_e: "e8", password: "7777", first: "Chin", last: "Tempest", code: "d4").save!
        # Employee.new(id_e: "e9", password: "8888", first: "Kurumi", last: "Tempest", code: "d4").save!
        # Employee.new(id_e: "e10", password: "9999", first: "Shidou", last: "Tempest", code: "d2").save!

        # ShiftTime.new(shifter_code: "s1", start_plan: "00:00", end_plan: "08:00").save!
        # ShiftTime.new(shifter_code: "s2", start_plan: "08:00", end_plan: "16:00").save!
        # ShiftTime.new(shifter_code: "s3", start_plan: "16:00", end_plan: "00:00").save!
        # ShiftTime.new(shifter_code: "s4", start_plan: "00:30", end_plan: "08:30").save!
        # ShiftTime.new(shifter_code: "s5", start_plan: "08:30", end_plan: "16:30").save!
        # ShiftTime.new(shifter_code: "s6", start_plan: "16:30", end_plan: "00:30").save!

        # TimeRecode.new(id_e:"e1").save!
        # TimeRecode.new(id_e:"e2").save!
        # TimeRecode.new(id_e:"e3").save!
        # TimeRecode.new(id_e:"e4").save!
        # TimeRecode.new(id_e:"e5").save!
        # TimeRecode.new(id_e:"e6").save!
        # TimeRecode.new(id_e:"e7").save!
        # TimeRecode.new(id_e:"e8").save!
        # TimeRecode.new(id_e:"e9").save!
        # TimeRecode.new(id_e:"e10").save!
        
        visit login_path
        within('form') do
            fill_in 'user_name', with: 'm1'
            fill_in 'password', with: '1234'
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
        click_button 'Edit'
        a = DateTime.now.strftime('%Y-%m-%d')
        expect(current_path).to eql('/manage/d1.%s' % [a])
    end

    it 'check all my employee if I logout as manager' do    
        click_button 'Edit'
        a = DateTime.now.strftime('%Y-%m-%d')
        # expect(current_path).to eql('/manage/d1.%s' % [a])
        check('select-all')
    end

    
    it 'check assign my employee' do    
        click_button 'Edit'
        a = DateTime.now.strftime('%Y-%m-%d')
        # expect(current_path).to eql('/manage/d1.%s' % [a])
        check('select-all')
        fill_in 'fname', with: '1'
        click_button 'Assign OT'
        
    end
end

# arr = Array.new
# a = Manager.find_by_id_m('m1')
# pc = a.parent_code
# b = Department.find_by_parent_code(pc)
# code = b.code
# c = Employee.find_by_code(code)
# c.each do |em|
#     arr << em.id_e
# end
# puts arr