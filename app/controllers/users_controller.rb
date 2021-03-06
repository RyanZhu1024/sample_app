class UsersController < ApplicationController
	before_filter :signed_in_user,only:[:index,:edit,:update,:destroy,:following,:followers]
	before_filter :correct_user,only:[:edit,:update]
	before_filter :admin_user,only:[:destroy]
	before_filter :signed_in,only:[:new,:create]
	before_filter :admin_cant_be_destory,only:[:destroy]

	def following
		@title = "Following"
		@user = User.find(params[:id])
		@users = @user.followed_users.paginate(page: params[:page])
		render 'show_follow'
	end

	def followers
		@title = "Followers"
		@user = User.find(params[:id])
		@users = @user.followers.paginate(page: params[:page])
		render 'show_follow'
	end

	def new
		@user=User.new
	end

	def show
		@user=User.find(params[:id])
		@microposts=@user.microposts.paginate(page:params[:page],per_page:10)
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User destroyed."
		redirect_to users_path
	end

	def create
		@user=User.new(params[:user])
		if @user.save
			#save success
			sign_in @user
			flash[:success]="Welcome to sample app!!!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def index
		@users=User.paginate(page: params[:page],per_page:5)
	end

	def edit
		# @user=User.find(params[:id])
	end

	def update
		if @user.update_attributes(params[:user])
			flash[:success]="Profile updated"
			sign_in (@user)
			redirect_to @user
		else
			render 'edit'
		end
	end

	private

	def correct_user
		@user=User.find(params[:id])
		redirect_to root_path unless current_user?(@user)
	end

	def admin_user
		redirect_to(root_path) unless current_user.admin?
	end

	def signed_in
		if signed_in?
			redirect_to root_path
		end
	end

	def admin_cant_be_destory
		user=User.find(params[:id])
		if user.admin? and user==current_user
			flash[:error]="Admin can't destory itself."
			redirect_to current_user
		end
	end

end
