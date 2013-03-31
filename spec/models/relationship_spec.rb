require 'spec_helper'

describe Relationship do
	let(:follower){FactoryGirl.create(:user)}
	let(:followed){FactoryGirl.create(:user)}
	let(:relationship){follower.relationships.build(followed_id:followed.id)}

	subject{relationship}
	it {should be_valid}

	describe "accessible attributes" do
		it "should not allow access to follower id" do
			expect do
				Relationship.new(follower_id:follower.id)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end

	describe "follower methods" do
		it {should respond_to(:follower_id)}
		it {should respond_to(:followed_id)}
		its(:follower){should==follower}
		its(:followed){should==followed}
	end

	it "it should destroy the relavent relationships" do
		@relationship=follower.relationships.build(followed_id:followed.id)
		temprel=@relationship.dup
		follower.destroy
		temprel.should_not be_nil

		Relationship.find_by_follower_id(temprel.follower_id).should be_nil
		Relationship.find_by_followed_id(temprel.followed_id).should be_nil
	end

	describe "when follower_id is nil" do
		before {relationship.follower_id=nil}
		it {should_not be_valid}
	end

	describe "when followed_id is nil" do
		before {relationship.followed_id=nil}
		it {should_not be_valid}
	end
end
