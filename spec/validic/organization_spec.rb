# encoding: utf-8
require 'spec_helper'

describe Validic::Organization do

  let(:client) { Validic::Client.new }

  context "#get_organization" do
    before do
      @organization_response = client.get_organization({org_id: "51945d536a7e0cb3db000029", access_token: "ENTERPRISE_KEY"})
    end

    it "returns JSON response of Validic::Organization", vcr: true do
      @organization_response.should_not be_nil
    end

    it "status 200" do
      @organization_response.summary.status.should == 200 
    end

    it "has summary node" do
      @organization_response.summary.should_not be_nil
    end
  end

end
