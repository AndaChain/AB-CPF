require 'rails_helper'

RSpec.describe Employee, type: :model do
    current_user = Employee.find_or_create_by!(id_e: 'e1', password: '1230',code:'d1')
    it 'has a id and it is not nil' do
        employee_bot =  Employee.new(
            id_e: '',
            password: '1230'
        )
        expect(employee_bot).to_not be_valid

        employee_bot.id_e = 'e_bot'
        expect(employee_bot).to be_valid
    end

    it 'has a password and it is not nil' do
        employee_bot =  Employee.new(
            id_e: 'm1',
            password: ''
        )
        expect(employee_bot).to_not be_valid

        employee_bot.password = '1230'
        expect(employee_bot).to be_valid
    end


end