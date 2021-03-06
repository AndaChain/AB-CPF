# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Manager.create!(id_m: "m1",password: "1234",first: "Ruth",last: "Noceda",parent_code: "p1")
Manager.create!(id_m: "m2",password: "2468",first: "Iter",last: "Venehim",parent_code: "p2")

Department.create!(code: "d1", name: "Chicken Cleaner", parent_code: "p1")
Department.create!(code: "d2", name: "Chicken Plucking", parent_code: "p2")
Department.create!(code: "d3", name: "Chicken Processing", parent_code: "p2")
Department.create!(code: "d4", name: "Transport", parent_code: "p1")

=begin
Employee.create!(id_e: "e1", password: "0000", first: "Rimuru", last: "Tempest", code: "d1", shifter_code: "s1", ot_plan: 2)
Employee.create!(id_e: "e2", password: "1111", first: "Nagisa", last: "Tempest", code: "d2", shifter_code: "s1", ot_plan: 2)
Employee.create!(id_e: "e3", password: "2222", first: "Anda", last: "Tempest", code: "d2", shifter_code: "s5", ot_plan: 1)
Employee.create!(id_e: "e4", password: "3333", first: "Sasaki", last: "Tempest", code: "d1", shifter_code: "s2", ot_plan: 2)
Employee.create!(id_e: "e5", password: "4444", first: "Sasako", last: "Tempest", code: "d1", shifter_code: "s2", ot_plan: 1)
Employee.create!(id_e: "e6", password: "5555", first: "M.eagles", last: "Tempest", code: "d3", shifter_code: "s2", ot_plan: 1)
Employee.create!(id_e: "e7", password: "6666", first: "irina", last: "Tempest", code: "d3", shifter_code: "s3", ot_plan: 2)
Employee.create!(id_e: "e8", password: "7777", first: "Chin", last: "Tempest", code: "d4", shifter_code: "s3", ot_plan: 1)
Employee.create!(id_e: "e9", password: "8888", first: "Kurumi", last: "Tempest", code: "d4", shifter_code: "s4", ot_plan: 2)
Employee.create!(id_e: "e10", password: "9999", first: "Shidou", last: "Tempest", code: "d2", shifter_code: "s4", ot_plan: 1)
=end

Employee.create!(id_e: "e1", password: "0000", first: "Rimuru", last: "Tempest", code: "d1")
Employee.create!(id_e: "e2", password: "1111", first: "Nagisa", last: "Tempest", code: "d2")
Employee.create!(id_e: "e3", password: "2222", first: "Anda", last: "Tempest", code: "d2")
Employee.create!(id_e: "e4", password: "3333", first: "Sasaki", last: "Tempest", code: "d1")
Employee.create!(id_e: "e5", password: "4444", first: "Sasako", last: "Tempest", code: "d1")
Employee.create!(id_e: "e6", password: "5555", first: "M.eagles", last: "Tempest", code: "d3")
Employee.create!(id_e: "e7", password: "6666", first: "irina", last: "Tempest", code: "d3")
Employee.create!(id_e: "e8", password: "7777", first: "Chin", last: "Tempest", code: "d4")
Employee.create!(id_e: "e9", password: "8888", first: "Kurumi", last: "Tempest", code: "d4")
Employee.create!(id_e: "e10", password: "9999", first: "Shidou", last: "Tempest", code: "d2")

ShiftTime.create!(shifter_code: "s1", start_plan: "00:00", end_plan: "08:00")
ShiftTime.create!(shifter_code: "s2", start_plan: "08:00", end_plan: "16:00")
ShiftTime.create!(shifter_code: "s3", start_plan: "16:00", end_plan: "00:00")
ShiftTime.create!(shifter_code: "s4", start_plan: "00:30", end_plan: "08:30")
ShiftTime.create!(shifter_code: "s5", start_plan: "08:30", end_plan: "16:30")
ShiftTime.create!(shifter_code: "s6", start_plan: "16:30", end_plan: "00:30")

=begin
TimeRecode.create!(id_e:"e1", start_actual: "00:10", end_actual:"07:55", ot_actual: 2)
TimeRecode.create!(id_e:"e2", start_actual: "00:10", end_actual:"07:55", ot_actual: 2)
TimeRecode.create!(id_e:"e3", start_actual: "08:00", end_actual:"16:35", ot_actual: 1)
TimeRecode.create!(id_e:"e4", start_actual: "06:00", end_actual:"16:00", ot_actual: 3)
TimeRecode.create!(id_e:"e5", start_actual: "07:00", end_actual:"16:00", ot_actual: 1)
TimeRecode.create!(id_e:"e6", start_actual: "10:00", end_actual:"15:00", ot_actual: 1)
TimeRecode.create!(id_e:"e7", start_actual: "17:00", end_actual:"23:00", ot_actual: 1)
TimeRecode.create!(id_e:"e8", start_actual: "17:00", end_actual:"23:03", ot_actual: 1)
TimeRecode.create!(id_e:"e9", start_actual: "23:00", end_actual:"09:00", ot_actual: 2)
TimeRecode.create!(id_e:"e10", start_actual: "23:00", end_actual:"09:00", ot_actual: 1)
=end

TimeRecode.create!(id_e:"e1")
TimeRecode.create!(id_e:"e2")
TimeRecode.create!(id_e:"e3")
TimeRecode.create!(id_e:"e4")
TimeRecode.create!(id_e:"e5")
TimeRecode.create!(id_e:"e6")
TimeRecode.create!(id_e:"e7")
TimeRecode.create!(id_e:"e8")
TimeRecode.create!(id_e:"e9")
TimeRecode.create!(id_e:"e10")





