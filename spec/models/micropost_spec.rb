require 'spec_helper'

describe Micropost do
	let(:user){FactoryGirl.create(:user)}
	before do
		# @micropost=Micropost.new(content:"first micropost",user_id:user.id)
		@micropost=user.microposts.build(:content=>"first micropost")
	end

	subject (@micropost)
	it {should respond_to(:content)}
	it {should respond_to(:user_id)}
	it {should respond_to(:user)}
	its(:user){should==user}

	describe "accessible attributes" do
		it "should not allow accessing to user_id" do
			expect do
				Micropost.new(content:"second micropost",user_id:user.id)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end

	describe "when user_id is not present" do
		before{@micropost.user_id=nil}
		it {should_not be_valid}
	end
end
