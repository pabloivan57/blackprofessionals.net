class CommentsController < ApplicationController
  def index
    @comments = Comments.all
  end
end