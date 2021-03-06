class PagesController < ApplicationController
  before_action :find_story, only: [:show]

  def index
    # @stories = Story.order(created_at: :desc).includes(:user)
    # @stories = Story.where(status: :published).order(created_at: :desc).includes(:user)
    # @stories = Story.published_stories.order(created_at: :desc).includes(:user)
    # @stories = published.with_attached_cover_image.order(created_at: :desc).includes(:user) 
    @stories = Story.published_stories
  end

  def show
    @comment = Comment.new
    @comments = @story.comments.order(id: :desc)
  end

  def user
    @user = User.find_by(username: params[:username])
  end

  private
  def find_story
    @story = Story.friendly.find(params[:story_id])
  end
 
end
