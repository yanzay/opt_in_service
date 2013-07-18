require 'spec_helper'

describe Application do
  describe 'create' do
    let(:valid_opt_in) do
      opt_in = JSON.parse(FactoryGirl.build(:opt_in).to_json)
    end

    it 'creates new entry if params are valid' do
      OptIn.count.should == 0
      post '/', valid_opt_in
      last_response.should be_ok
      OptIn.count.should == 1
    end

    it 'activates entry when creates' do
      post '/', valid_opt_in
      OptIn.first.active.should be_true
    end

    it 'returns "bad request" response if params are invalid' do
      post '/', valid_opt_in.except("email")
      last_response.status.should == 400 # Bad request
      OptIn.count.should == 0
    end
  end

  describe 'update' do
    before do
      @opt_in = FactoryGirl.create(:opt_in)
    end

    it 'updates attributes of opt_in and returns 200 if params are valid' do
      put '/', id: @opt_in.id, email: "new_email@gmail.com"
      last_response.should be_ok
      @opt_in.reload.email.should == "new_email@gmail.com"
    end

    it 'returns "bad request" if params are invalid' do
      put '/', id: @opt_in.id, email: ""
      last_response.status.should == 400
    end

    it 'returns 404 if entry not found' do
      put '/', id: @opt_in.id + 1, email: "new_email@gmail.com"
      last_response.should be_not_found
    end
  end

  describe 'delete' do
    before do
      @opt_in = FactoryGirl.create(:opt_in)
    end

    it 'set "active" to false if entry exists' do
      delete "/#{@opt_in.id}"
      last_response.should be_ok
      @opt_in.reload.active.should be_false
    end

    it 'returns 404 if entry does not exist' do
      delete "/#{@opt_in.id + 1}"
      last_response.should be_not_found
    end
  end

  describe 'dictionaries' do
    before do
      FactoryGirl.create_list(:company, 10)
      FactoryGirl.create_list(:permission_type, 10)
      FactoryGirl.create_list(:channel, 10)
    end
    
    ['companies', 'permission_types', 'channels'].each do |dict|
      it "#{dict} returns set of entries" do
        get "/#{dict}"
        last_response.should be_ok
        JSON.parse(last_response.body).should_not be_empty
      end
    end
  end
end
