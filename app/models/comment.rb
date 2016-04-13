class Comment < ActiveRecord::Base
  belongs_to :post #is associated with post
  belongs_to :user #is associated with the comment poster
end
