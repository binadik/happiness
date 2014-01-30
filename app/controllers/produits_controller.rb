class ProduitsController < ApplicationController
  before_action :set_produit, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
  @produits = Produit.all
  end

  def show
  end

  def new
    @produit = current_user.produits.build
  end

  def edit
  end

  def create
    @produit = current_user.produits.build(produit_params)

    respond_to do |format|
      if @produit.save
        format.html { redirect_to @produit, notice: 'Produit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @produit }
      else
        format.html { render action: 'new' }
        format.json { render json: @produit.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @produit.update(produit_params)
        format.html { redirect_to @produit, notice: 'Produit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @produit.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @produit.destroy
    respond_to do |format|
      format.html { redirect_to produits_url }
      format.json { head :no_content }
    end
  end

  private

    def set_produit
      @produit = Produit.find(params[:id])
    end

    def correct_user
      @produit = current_user.produits.find_by(id: params[:id])
      redirect_to produits_path, notice: "You are not authorized to edit this product" if @produit.nil?
    end

    def produit_params
      params.require(:produit).permit(:nom, :description, :image)
    end

end
