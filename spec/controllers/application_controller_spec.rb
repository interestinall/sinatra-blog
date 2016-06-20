require_relative "spec_helper"

def app
  ApplicationController
end

describe ApplicationController do
  it "loads right templete for index" do
    get '/'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Welcome to Plain Blog")
  end
end
