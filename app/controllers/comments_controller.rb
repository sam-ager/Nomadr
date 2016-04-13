class CommentsController < ApplicationController

	before_action :authenticate_user! #Before function, authenticate user

	def create
		@post = Post.find(params[:post_id]) #Define user by current ID
		@comment = Comment.create(params[:comment].permit(:content)) #Allow comment to be created
		@comment.user_id = current_user.id #Link comment to user by ID
		@comment.post_id = @post.id #Link comment to user by User ID and Post IS

		if @comment.save
			redirect_to post_path(@post) #Once SAved, re-direct to comment
		else
			render 'new' #Else render a new comment
	end
end
end
