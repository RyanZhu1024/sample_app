require 'spec_helper'

describe "StaticPages" do
  let(:basic){"Ruby On Rails tutorial Sample App"}

  describe "Home page" do
    it "should have the content h1 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('h1',:text=>'Home')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title',:text=>"Ruby On Rails tutorial Sample App")
    end
    
    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title',:text=>'|Home')
    end

  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1',:text=>'Help')
      page.should have_selector('title',:text=>"#{basic} | Help")
    end
  end

  describe "About page" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1',:text=>'About Us')
      page.should have_selector('title',:text=>"#{basic} | About Us")
    end
  end

  describe "Contact" do
    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('h1',:text=>'Contact')
      page.should have_selector('title',:text=>"Ruby On Rails tutorial Sample App | Contact")
    end
  end
end
