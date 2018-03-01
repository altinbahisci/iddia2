class IceriksController < ApplicationController
  before_action :set_icerik, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new,:show, :edit, :destroy,:index]
  before_action :kontrol, only:[:edit, :destroy,:show,:index]
  
  def kontrol
    if current_user.email!='admin@admin.com'
      redirect_to posts_path
    end  
  end
  # GET /iceriks
  # GET /iceriks.json
  def index
    @iceriks = Icerik.all
  end

  # GET /iceriks/1
  # GET /iceriks/1.json
  def show
  end

  # GET /iceriks/new
  def new
    @icerik = Icerik.new
  end

  # GET /iceriks/1/edit
  def edit
  end

  # POST /iceriks
  # POST /iceriks.json
  def create
    @icerik = Icerik.new(icerik_params)

    respond_to do |format|
      if @icerik.save
        format.html { redirect_to @icerik, notice: 'Icerik was successfully created.' }
        format.json { render :show, status: :created, location: @icerik }
      else
        format.html { render :new }
        format.json { render json: @icerik.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iceriks/1
  # PATCH/PUT /iceriks/1.json
  def update
    respond_to do |format|
      if @icerik.update(icerik_params)
        format.html { redirect_to @icerik, notice: 'Icerik was successfully updated.' }
        format.json { render :show, status: :ok, location: @icerik }
      else
        format.html { render :edit }
        format.json { render json: @icerik.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iceriks/1
  # DELETE /iceriks/1.json
  def destroy
    @icerik.destroy
    respond_to do |format|
      format.html { redirect_to iceriks_url, notice: 'Icerik was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_icerik
      @icerik = Icerik.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def icerik_params
      params.require(:icerik).permit(:tarih, :mbs, :saat, :lig, :kod, :mac, :oran1, :oran2, :oran3, :oran4, :oran5, :oran6, :oran7, :oran8, :oran9, :oran10, :oran11, :oran12, :oran13, :oran14, :oran15, :oran16, :oran17, :oran18, :oran19, :oran20)
    end
end
