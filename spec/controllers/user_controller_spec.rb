require 'spec_helper'



describe UserController do 


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

end