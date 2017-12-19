class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_commentable

  # GET /commentable/:commentable_id/comments
  # GET /commentable/:commentable_id/comments.json
  def index
    @comments = @commentable.comments.order(created_at: :desc)
  end

  # GET /commentable/:commentable_id/new
  def new
    @comment = @commentable.comments.new
  end  

  # POST /commentable/:commentable_id/comments
  # POST /commentable/:commentable_id/comments.json
  def create
    @comment = @commentable.comments.new(comment_params)  
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: polymorphic_path([@commentable, @comment]) }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Only allow the white listed params through.
    def comment_params
      params.fetch(:comment, {}).permit(:body)
    end

    def set_commentable
      resource, id = request.path.split('/')[1,2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end
   
end  