require 'spec_helper'

describe UserController do 

  it 'loads sign up template' do 

    get '/signup'

    expect(last_response.status).to eq(200) 
    expect(page.body).to include('<form')
    expect(page.body).to include('Create an Account')

  end

end