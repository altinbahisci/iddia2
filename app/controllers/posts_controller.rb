class PostsController < ApplicationController
  before_action :set_post, only: [:show,:edit, :update, :destroy,:kontrol]
  before_action :iddia
  before_action :authenticate_user!, only: [:new,:show, :edit, :destroy]
  before_action :kontrol, only:[:edit, :destroy,:show]
  
  
  
  def kontrol
    if (current_user!=@post.user) && (current_user.email!='admin@admin.com')
      redirect_to posts_path, notice:"Yetkiniz yok!"
    end  
  end

  

  # GET /posts
  # GET /posts.json
  def index
    if user_signed_in?
      @posts = Post.where(user_id: current_user.id, onay:nil ).all
      @onayPosts = Post.where(user_id: current_user.id , onay:1).all
      @Postsduzen = Post.where(user_id: current_user.id , onay:2).all
      
      @admin = 'admin@admin.com'
      @onaypostadmin = Post.where(onay:nil).all
      @postadmin = Post.where(onay:2).all
      @selam = Post.where(onay:1).all
      
      @uyeler=User.all
      
      
    end
    
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments=@post.comments.all
  end

  
  # GET /posts/new
  def new
    @post = Post.new
  end
  
  def edit
  end
  
  
  def update

    if current_user.email=='admin@admin.com'
        if Post.find(params[:id]).onay==2
          @yenibakiye=Post.find(params[:id]).bakiye.to_f
          @user_id=@post.user.id
   
          respond_to do |format|
            if @post.update(post_params)
              @u = User.find(@post.user_id)
              @u.update_attributes(bakiye: @post.bakiye)
              format.html { redirect_to @post, notice: 'Başarıyla Kaydedildi.' }
              format.json { render :show, status: :ok, location: @post }
            else
              format.html { render :edit }
              format.json { render json: @post.errors, status: :unprocessable_entity }
            end
          end
        else
          respond_to do |format|
            if @post.update(post_params)
              format.html { redirect_to @post, notice: 'Başarıyla Kaydedildi.' }
              format.json { render :show, status: :ok, location: @post }
              @u = User.find(@post.user_id)
              @u.update_attributes(bakiye: @post.bakiye)
    
            else
              format.html { render :edit }
              format.json { render json: @post.errors, status: :unprocessable_entity }
            end
          end
        end

    else
      

      if Post.find(params[:id]).onay==2
        if ((current_user.bakiye.to_f) > (Post.find(params[:id]).sum.to_f))
          respond_to do |format|
            if @post.update(post_params)
              format.html { redirect_to @post, notice: 'Başarıyla Kaydedildi.' }
              format.json { render :show, status: :ok, location: @post }
              @bakiyeuser=User.find(current_user.id).bakiye
              @onayPosts = Post.find(params[:id]).sum.to_f
              @yenibakiye = @bakiyeuser - @onayPosts
              
              
              
              @u = User.find(current_user.id) 
              @u.update_attributes(bakiye: @yenibakiye) 
              
            else
              format.html { render :edit }
              format.json { render json: @post.errors, status: :unprocessable_entity }
            end
          end
        else
          redirect_to posts_path, notice:"Yetersiz Bakiye!"
        end 
      elsif Post.find(params[:id]).onay==nil
          respond_to do |format|
            if @post.update(post_params)
              format.html { redirect_to @post, notice: 'Başarıyla Kaydedildi.' }
              format.json { render :show, status: :ok, location: @post }
            else
              format.html { render :edit }
              format.json { render json: @post.errors, status: :unprocessable_entity }
            end
          end
      else  
        
        redirect_to posts_path
      end
    
    end
    
    

    
    
    
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user=current_user
    
    respond_to do |format|
      if @post.save
      
        format.html { redirect_to @post, notice: 'Başarıyla Kaydedildi.' }
        format.json { render :show, status: :created, location: @post }
        format.js
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    
    end
    
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @sil=Comment.where(post_id: params[:id])
    @sil.destroy_all
    
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Başarıyla Silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title,:sum,:onay,:bakiye,:tutar)
    end
    
    def iddia
      @tarih = []
      @iddaaKodu = []
      @saat = []
      @lig = []
      @macIsmi = []
      @mbs = []
      @oran1 = []
      @oran2 = []
      @oran3 = []
      @oran4 = []
      @oran5 = []
      @oran6 = []
      @oran7 = []
      @oran8 = []
      @oran9 = []
      @oran10 = []
      @oran11 = []
      @oran12 = []
      @oran13 = []
      @oran14 = []
      @oran15 = []
      @oran16 = []
      @oran17 = []
      @oran18 = []    
      @oran19 = []  
      @oran20 = []
      
      @macekle=Icerik.all
    
    end
    
end
