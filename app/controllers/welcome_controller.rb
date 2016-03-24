class WelcomeController < ApplicationController
  def index
    category = Category.search("Presentation")[0]
    @posts = category.posts.where(published: true)
    category = Category.search("Events")[0]
    if !category.nil?
      @events = category.posts.where(published: true)
    end
  end
end
