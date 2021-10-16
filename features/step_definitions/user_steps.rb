#-------------------------------------------
Given /^a valid Manager$/ do
    @Manager = Manager.create!({
               :id_m => "m1",
               :password => "123",
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

#When /^(?:|I )fill in the following:$/ do |fields|
#  fields.rows_hash.each do |name, value|
#    When %{I fill in "#{name}" with "#{value}"}
#  end
#end