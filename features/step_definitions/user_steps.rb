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
end
#-------------------------------------------
Given /^a valid Employee2$/ do
  @Employee = Employee.create!({
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
Given /^a valid Department$/ do
  @Manager = Department.create!({
             :code => "d1",
             :name => "Chicken Cleaner",
             :parent_code => "p1",
           })
end
#-------------------------------------------

#When /^(?:|I )fill in the following:$/ do |fields|
#  fields.rows_hash.each do |name, value|
#    When %{I fill in "#{name}" with "#{value}"}
#  end
#end