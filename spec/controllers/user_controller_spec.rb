require 'spec_helper'



describe UserController do 

  it 'loads signup page' do 
    get '/signup'
    expect(last_response.status).to eq(200)

  end


  it 'saves new user' do   
    visit '/signup' 
    fill_in("user[username]", :with => "mikkkeee")
    fill_in("user[password]", :with => "joneezzz")
    fill_in("user[email]", :with => "mike@jonez.com")
    click_button 'submit'
    
    expect(User.count).to eq(1)  
  end 

  it 'redirects upon creation' do
    visit '/signup' 
    fill_in("user[username]", :with => "mikkkeee")
    fill_in("user[password]", :with => "joneezzz")
    fill_in("user[email]", :with => "mike@jonez.com")
    click_button 'submit'
    expect(page.body).to include("mikkkeee")
  end 

  it 'loads login page' do 
    get '/login'
    expect(last_response.status).to eq(200)

  end

end