class WelcomeController < ApplicationController
  def index
    category = Category.search("Presentation")[0]
    @posts = category.posts.where(published: true)
    @gallery = category.galleries.last
    category = Category.search("Important")[0]
    @importants = category.posts.where(published: true).last(3)
  end
end
