class PostPartsController < ApplicationController
  def new
    @post_part = PostPart.new
  end
end
