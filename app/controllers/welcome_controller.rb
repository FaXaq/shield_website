class WelcomeController < ApplicationController
  def index
    category = Category.search("Presentation")[0]
    @posts = category.posts.where(published: true)
    @gallery = category.galleries.last
  end
end
