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
    else
      

      if Post.find(params[:id]).onay==2
        if ((current_user.bakiye.to_f) > (Post.find(params[:id]).tutar.to_f))
          respond_to do |format|
            if @post.update(post_params)
              format.html { redirect_to @post, notice: 'Başarıyla Kaydedildi.' }
              format.json { render :show, status: :ok, location: @post }
              @bakiyeuser=User.find(current_user.id).bakiye
              @onayPosts = Post.find(params[:id]).tutar.to_f
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
      params.require(:post).permit(:title,:sum,:onay,:bakiye,:product,:tutar)
    end
    
    def iddia
      require 'openssl'
      require 'open-uri'
      require 'nokogiri'
      doc = Nokogiri::HTML(open('http://www.iddaliyim.net/iddaliyim_ic_program.php', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE ,'User-Agent' => 'Nooby'))
      entries = doc.css('tr#cif')
      entries2 = doc.css('tr#tek')
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
      
      entries2.each do |entry|
        tarihagun= entry.css('td#tar').text[0..1]
        tarihay = entry.css('td#tar').text[3..4]
        
        current_timeday=Time.now.strftime("%d")
        current_timemonth=Time.now.strftime("%m")
        if tarihagun>=current_timeday || tarihay>current_timemonth
            tarih= entry.css('td#tar').text
            @tarih.push(tarih)
            iddaaKodu = entry.css('td#oran')[0].text
            @iddaaKodu.push(iddaaKodu)
            saat = entry.css('td#orst').text
            @saat.push(saat)
            lig = entry.css('td#oranlg').text
            @lig.push(lig)
            macIsmi = entry.css('td#mac').text
            @macIsmi.push(macIsmi)
            mbs = entry.css('td#mbs').text
            @mbs.push(mbs)
            oran1 = entry.css('td#oran')[1].text
            @oran1.push(oran1)
            
            oran2 = entry.css('td#oran')[2].text
            @oran2.push(oran2)
            
            oran3 = entry.css('td#oran')[3].text
            @oran3.push(oran3)    
            
            oran4 = entry.css('td#oran')[4].text
            @oran4.push(oran4)
            
            oran5 = entry.css('td#oran')[5].text
            @oran5.push(oran5)
            
            oran6 = entry.css('td#oran')[6].text
            @oran6.push(oran6)
            
            oran7 = entry.css('td#oran')[7].text
            @oran7.push(oran7)
            
            oran8 = entry.css('td#oran')[8].text
            @oran8.push(oran8)
            
            oran9 = entry.css('td#oran')[9].text
            @oran9.push(oran9)
            
            oran10 = entry.css('td#oran')[10].text
            @oran10.push(oran10)
            
            oran11 = entry.css('td#oran')[11].text
            @oran11.push(oran11) 
            
            oran12 = entry.css('td#oran')[12].text
            @oran12.push(oran12)
            
            oran13 = entry.css('td#oran')[13].text
            @oran13.push(oran13)
            
            oran14 = entry.css('td#oran')[14].text
            @oran14.push(oran14)      
            
            oran15 = entry.css('td#oran')[15].text
            @oran15.push(oran15)         
            
            oran16 = entry.css('td#oran')[16].text
            @oran16.push(oran16)         
            
            oran17 = entry.css('td#oran')[17].text
            @oran17.push(oran17)   
            
            oran18 = entry.css('td#oran')[18].text
            @oran18.push(oran18)         
            
            oran19 = entry.css('td#oran')[19].text
            @oran19.push(oran19)         
            
            oran20 = entry.css('td#oran')[20].text
            @oran20.push(oran20) 
           
        end
      end  
    
      entries.each do |entry|
        tarihagun= entry.css('td#tar').text[0..1]
        tarihay = entry.css('td#tar').text[3..4]
        
        current_timeday=Time.now.strftime("%d")
        current_timemonth=Time.now.strftime("%m")
        if tarihagun>=current_timeday || tarihay>current_timemonth
            tarih= entry.css('td#tar').text
            @tarih.push(tarih)
            iddaaKodu = entry.css('td#oran')[0].text
            @iddaaKodu.push(iddaaKodu)
            saat = entry.css('td#orst').text
            @saat.push(saat)
            lig = entry.css('td#oranlg').text
            @lig.push(lig)
            macIsmi = entry.css('td#mac').text
            @macIsmi.push(macIsmi)
            mbs = entry.css('td#mbs').text
            @mbs.push(mbs)
            oran1 = entry.css('td#oran')[1].text
            @oran1.push(oran1)
            
            oran2 = entry.css('td#oran')[2].text
            @oran2.push(oran2)
            
            oran3 = entry.css('td#oran')[3].text
            @oran3.push(oran3)    
            
            oran4 = entry.css('td#oran')[4].text
            @oran4.push(oran4)
            
            oran5 = entry.css('td#oran')[5].text
            @oran5.push(oran5)
            
            oran6 = entry.css('td#oran')[6].text
            @oran6.push(oran6)
            
            oran7 = entry.css('td#oran')[7].text
            @oran7.push(oran7)
            
            oran8 = entry.css('td#oran')[8].text
            @oran8.push(oran8)
            
            oran9 = entry.css('td#oran')[9].text
            @oran9.push(oran9)
            
            oran10 = entry.css('td#oran')[10].text
            @oran10.push(oran10)
            
            oran11 = entry.css('td#oran')[11].text
            @oran11.push(oran11) 
            
            oran12 = entry.css('td#oran')[12].text
            @oran12.push(oran12)
            
            oran13 = entry.css('td#oran')[13].text
            @oran13.push(oran13)
            
            oran14 = entry.css('td#oran')[14].text
            @oran14.push(oran14)      
            
            oran15 = entry.css('td#oran')[15].text
            @oran15.push(oran15)         
            
            oran16 = entry.css('td#oran')[16].text
            @oran16.push(oran16)         
            
            oran17 = entry.css('td#oran')[17].text
            @oran17.push(oran17)   
            
            oran18 = entry.css('td#oran')[18].text
            @oran18.push(oran18)         
            
            oran19 = entry.css('td#oran')[19].text
            @oran19.push(oran19)         
            
            oran20 = entry.css('td#oran')[20].text
            @oran20.push(oran20) 
           
        end
      end    
    end
    
end
