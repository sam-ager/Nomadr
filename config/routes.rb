Rails.application.routes.draw do

  devise_for :users
  
  resources :posts do #Allow functionality for users
  	member do
  		get "like", to: "posts#upvote"
  		get "dislike", to: "posts#downvote"
  	end
  	resources :comments
  end

authenticated do
  root :to => 'posts#userindex', as: :authenticated #If user is logged in, make userindex page the home page
end

  root 'posts#index' # Else make index page home page for non logged in users



  get '/user/:id' => 'posts#profile' #link to user profiles, defined by user id (username)

  get 'explore' => 'posts#explore' #Link to explore page

end
