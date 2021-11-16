# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Manager.create!(id_m: "m1",password: "123",first: "A",last: "a",parent_code: "m1")
Manager.create!(id_m: "m2",password: "123",first: "B",last: "b",parent_code: "m2")

Department.create!(code: "d1", name: "PIG1", parent_code: "m1")
Department.create!(code: "d2", name: "Fish", parent_code: "m2")
Department.create!(code: "d3", name: "Chicken", parent_code: "m2")
Department.create!(code: "d4", name: "PIG2", parent_code: "m1")

Employee.create!(id_e: "e1", password: "123", first: "1", last: "x", code: "d1", shifter_code: "s1", ot_plan: 2)
Employee.create!(id_e: "e2", password: "123", first: "2", last: "x", code: "d2", shifter_code: "s1", ot_plan: 2)
Employee.create!(id_e: "e3", password: "123", first: "3", last: "x", code: "d2", shifter_code: "s5", ot_plan: 1)
Employee.create!(id_e: "e4", password: "123", first: "4", last: "x", code: "d1", shifter_code: "s2", ot_plan: 2)
Employee.create!(id_e: "e5", password: "123", first: "5", last: "x", code: "d1", shifter_code: "s2", ot_plan: 1)
Employee.create!(id_e: "e6", password: "123", first: "6", last: "x", code: "d3", shifter_code: "s2", ot_plan: 1)
Employee.create!(id_e: "e7", password: "123", first: "7", last: "x", code: "d3", shifter_code: "s3", ot_plan: 2)
Employee.create!(id_e: "e8", password: "123", first: "8", last: "x", code: "d4", shifter_code: "s3", ot_plan: 1)
Employee.create!(id_e: "e9", password: "123", first: "9", last: "x", code: "d4", shifter_code: "s4", ot_plan: 2)
Employee.create!(id_e: "e10", password: "123", first: "10", last: "x", code: "d2", shifter_code: "s4", ot_plan: 1)



ShiftTime.create!(shifter_code: "s1")
ShiftTime.create!(shifter_code: "s2")
ShiftTime.create!(shifter_code: "s3")
ShiftTime.create!(shifter_code: "s4")
ShiftTime.create!(shifter_code: "s5")
ShiftTime.create!(shifter_code: "s6")







