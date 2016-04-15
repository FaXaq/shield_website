class WelcomeController < ApplicationController
  def index
    category = Category.search("Presentation")[0]
    @gallery = category.galleries.last
    category = Category.search("Important")[0]
    @importants = category.posts.where(published: true).last(3)
  end
end
