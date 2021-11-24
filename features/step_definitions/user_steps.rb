#-------------------------------------------
Given /^a valid Manager$/ do
    @Manager = Manager.create!({
               :id_m => "m1",
               :password => "123",
               :first => "Nontouch",
               :last => "Kongdee",
               :parent_code => "p1",
               
             })
  end
#-------------------------------------------
Given /^a valid Employee$/ do
  @Employee = Employee.create!({
             :id_e => "e1",
             :password => "111",
             :first => "chain",
             :last => "anda",
             :code => "d1",
             :shifter_code => "s1",
             :ot_plan => 2,
           })

  @Employee2 = Employee.create!({
             :id_e => "e2",
             :password => "222",
             :first => "sasaki",
             :last => "tomoru",
             :code => "d1",
             :shifter_code => "s1",
             :ot_plan => 1,
           })
end
#-------------------------------------------
Given /^a valid Employee2$/ do
  @Employee3 = Employee.create!({
             :id_e => "e3",
             :password => "333",
             :first => "sasako",
             :last => "tomoya",
             :code => "d1",
             :shifter_code => nil,
             :ot_plan => 1,
           })

  @Employee4 = Employee.create!({
             :id_e => "e4",
             :password => "444",
             :first => "sasachain",
             :last => "andaru",
             :code => "d1",
             :shifter_code => nil,
             :ot_plan => 1,
           })
end
#-------------------------------------------
Given /^a valid Department$/ do
  @Manager2 = Department.create!({
             :code => "d1",
             :name => "Chicken Cleaner",
             :parent_code => "p1",
           })
end
#-------------------------------------------
Given /^a valid KeepShift$/ do
  @Manager3 = KeepShift.create!({
             :id_e => "e1",
             :keep_shift => {"2021-11-23"=>[nil, 0], nil=>[nil, 0], "2021-11-24"=>["s1", 2], "2021-11-01"=>["s1", 3], "2021-12-30"=>["s1", 0]},
           })
  @Manager4 = KeepShift.create!({
             :id_e => "e2",
             :keep_shift => {"2021-11-23"=>[nil, 0], nil=>[nil, 0], "2021-11-24"=>["s1", 1], "2021-11-01"=>["s1", 3], "2021-12-30"=>["s1", 0]},
           })
  @Manager5 = KeepShift.create!({
             :id_e => "e3",
             :keep_shift => {"2021-11-23"=>[nil, 0], nil=>[nil, 0], "2021-11-24"=>[nil, 0], "2021-11-01"=>["s1", 3], "2021-12-30"=>["s1", 0]},
           })
  @Manager6 = KeepShift.create!({
             :id_e => "e4",
             :keep_shift => {"2021-11-23"=>[nil, 0], nil=>[nil, 0], "2021-11-24"=>[nil, 0], "2021-11-01"=>["s1", 3], "2021-12-30"=>["s1", 0]},
           })
end
#-------------------------------------------
Given /^a valid ShiftTime$/ do
  @Manager7 = ShiftTime.create!({
             :shifter_code => "s1",
             :start_plan => "08:00",
             :end_plan => "16:00",
           })
end
#-------------------------------------------
Given /^a valid TimeRecode$/ do
  @Manager8 = TimeRecode.create!({
             :id_e => "e1",
             :start_actual => nil,
             :end_actual => nil,
             :ot_actual => 0,
           })
  @Manager9 = TimeRecode.create!({
             :id_e => "e2",
             :start_actual => nil,
             :end_actual => nil,
             :ot_actual => 0,
           })
  @Manager10 = TimeRecode.create!({
             :id_e => "e3",
             :start_actual => nil,
             :end_actual => nil,
             :ot_actual => 0,
           })
  @Manager10 = TimeRecode.create!({
             :id_e => "e4",
             :start_actual => nil,
             :end_actual => nil,
             :ot_actual => 0,
           })
end
#-------------------------------------------

#When /^(?:|I )fill in the following:$/ do |fields|
#  fields.rows_hash.each do |name, value|
#    When %{I fill in "#{name}" with "#{value}"}
#  end
#end