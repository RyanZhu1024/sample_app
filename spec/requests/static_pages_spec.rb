require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have the content h1 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('h1',:text=>'Home')
      page.should have_selector('title',:text=>"Ruby On Rails tutorial Sample App | Home")
    end
  end

  describe "Help page" do
  	it "should have the content 'Help'" do
  		visit '/static_pages/help'
  		page.should have_selector('h1',:text=>'Help')
      page.should have_selector('title',:text=>"Ruby On Rails tutorial Sample App | Help")
  	end
  end

  describe "About page" do
  	it "should have the content 'About Us'" do
  		visit '/static_pages/about'
  		page.should have_selector('h1',:text=>'About Us')
      page.should have_selector('title',:text=>"Ruby On Rails tutorial Sample App | About Us")
  	end
  end
end
