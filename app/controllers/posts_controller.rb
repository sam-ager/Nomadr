class PostsController < ApplicationController

	before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote, :avatar] #Allow stated paramaters to be posted
	before_action :authenticate_user!, except: [:index, :explore, :show] #Allow these pages to be accessed by non logged in user, otherwise re-direct them to log in

	def userindex
		@posts = Post.all.order("created_at DESC") #Display all posts created in descending order
	end

	def profile
		@posts = Post.all.order("created_at DESC").where("user_id = ?", User.find_by_name(params[:id]).id) #Display all posts created in descending order associated with user

	    if (User.find_by_name(params[:id])) #Define URL by username
	      @username = params[:id]

	    else
	      redirect_to root_path, :notice => "User Not Found!" #If not found, display notice
	    end 

	end

	def show
		@comments = Comment.where(post_id: @post) #Allow comments on posts

	end

	def new
		@post = current_user.posts.build #Associate created post with user currently logged in
	end

	def create
		@post = current_user.posts.build(post_params) #Associate created post with user currently logged in

		if @post.save
			redirect_to @post #Once post is saved, re-direct to post
		else
			render 'new' #Otherwise render new post
		end
	end

	def edit
	end

	def update
		if @post.update(post_params) #Update posts
			redirect_to @post #Once edited, re-direct to post
		else
			render 'edit' #else open edit page
		end
	end

	def destroy
		@post.destroy #Destroy post
		redirect_to root_path #Re-direct back to home
	end

	def upvote
		@post.upvote_by current_user #Allow users to upvote post
		redirect_to :back
	end

	def downvote
		@post.downvote_by current_user #Allow users to downvote post
		redirect_to :back
	end

	private

	def find_post
		@post = Post.find(params[:id]) #Find posts by posts associated with :id (username)
	end

	def post_params
		params.require(:post).permit(:title, :image, :description, :avatar) #Allow stated paramaters to be posted
	end
end
