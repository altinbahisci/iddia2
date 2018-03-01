class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]
  
  # GET /comments
  # GET /comments.json
  def index
    @comments = @post.comments.all
    
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = @post.comments.find(params[:id])
  end
  

  # GET /comments/new
  def new
    @comment = @post.comments.new
  end

  # POST /comments
  # POST /comments.json
  def create
      @post=Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)  
      @comment.user=current_user
      @macsayisi=Comment.where(post_id: params[:post_id]).count  
      if @comment.sum==nil
         @comment.sum=1
         @comment.save
      end
        
    respond_to do |format|
      if @comment.save
          
          (0..@macsayisi).each do |i|
             @sum = Comment.where(post_id: params[:post_id]).last.sum  * Comment.where(post_id: params[:post_id]).pluck(*:oran)[i].to_f 
             @comment.sum=@sum
             @comment.save
          end

        
        format.js
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
     
  end

              
             
  def destroy
    @comment = @post.comments.find(params[:id])
    @o=@comment.oran.to_f
    @comment.destroy
    
    @p=@comment.sum.to_f
    @n=Comment.where(post_id: params[:post_id]).last.sum.to_f / @o
    
    @r=Comment.where(post_id: params[:post_id]).last
    @r.sum=@n
    @r.save
    
    respond_to do |format|
      format.html { redirect_to post_url(params[:post_id]) }
    end
  end

  private
    def set_comment
      @post = Post.find(params[:post_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:bdy,:mac,:mbs,:kod,:oran,:durum,:sum)
    end
    
    

  
end
