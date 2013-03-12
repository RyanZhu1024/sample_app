require 'spec_helper'

describe "StaticPages2s" do
  describe "index" do
    it "should display the content of index" do
    	visit '/static_pages2/index'
    	page.should have_content('index')
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      # get static_pages2s_path
      # response.status.should be(200)
    end
  end

  describe "list" do
  	it "should display the content of 'list'" do
  		visit '/static_pages2/list'
  		page.should have_content('list')
  	end
  end
  
end
