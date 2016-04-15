class StaticController < ApplicationController
  def aboutus
    category = Category.search("Presentation")[0]
    @posts = category.posts.where(published: true)
  end

  def events
  end
end
