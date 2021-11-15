require 'rails_helper'

describe ManageController do
    describe 'login' do
        before :each do
            @mock_manager_attributes = {manage:{:id_m => 'm1', :passowrd => '1230'}} #mock up parameter
        end
        it 'should stay in login_path if error' do
            post :index, params: {:id_m => @mock_manager_attributes}
            expect(response).to redirect_to(login_path) #is that redirect to add review by it own review movie
        end
    end
end