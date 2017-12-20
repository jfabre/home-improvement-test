class CommentsController < ProtectedController
  before_action :skip_policy_scope
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_commentable

  # GET /commentable/:commentable_id/comments
  # GET /commentable/:commentable_id/comments.json
  def index
    if @commentable.present?
      @comments = @commentable.comments.order(created_at: :desc)
    else
      @comments = Comment.all.order(created_at: :desc)  
    end  
  end

  # GET /comments/1
  def show
    authorize @comment
  end

  # GET /commentable/:commentable_id/new
  def new
    @comment = @commentable.comments.new
    authorize @comment
  end  

  def edit
    authorize @comment
  end  

  # POST /commentable/:commentable_id/comments
  # POST /commentable/:commentable_id/comments.json
  def create
    @comment = @commentable.comments.new(comment_params)  
    @comment.user = current_user
    authorize @comment

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: polymorphic_path([@commentable, @comment]) }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    authorize @comment 

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    authorize @comment
    @comment.destroy
    
    respond_to do |format|
      format.html { redirect_to comments_path, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_comment
      @comment = Comment.includes(:user, :commentable).find(params[:id])
    end

    # Only allow the white listed params through.
    def comment_params
      params.fetch(:comment, {}).permit(:body)
    end

    def set_commentable
      resource, id = request.path.split('/')[1,2]
      @commentable = resource.singularize.classify.constantize.find(id) if id.present?
    end
   
end  