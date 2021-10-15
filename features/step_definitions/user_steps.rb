#-------------------------------------------
Given /^a valid Manager$/ do
    @Manager = Manager.create!({
               :id_m => "m1",
               :password => "123",
             })
  end
#-------------------------------------------

#When /^(?:|I )fill in the following:$/ do |fields|
#  fields.rows_hash.each do |name, value|
#    When %{I fill in "#{name}" with "#{value}"}
#  end
#end