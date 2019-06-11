class OffersController < ApplicationController
  before_action :find_offer, only: [:edit, :update, :destroy]
  before_action :find_volunteer_and_talent, only: [:create, :update]

  def index
    @volunteer = User.find(params[:user_id])
    @talent = Talent.find(params[:talent_id])
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.volunteer = @volunteer
    @offer.talent = @talent
    if @offer.save
      redirect_to user_path(@volunteer)
    else
      render 'users/show'
    end
  end

  def edit
  end

  def update
    @offer.volunteer = @volunteer
    @offer.talent = @talent
    if @offer.update(offer_params)
      redirect_to user_path(@volunteer)
    else
      render 'users/show'
    end
  end

  def destroy
    @volunteer = @offer.volunteer
    @offer.destroy
    redirect_to user_path(@volunteer)
  end

  private

  def offer_params
    params.require(:offer).permit(:comment)
  end

  def find_offer
    @offer = Offer.find(params[:id])
  end

  def find_volunteer_and_talent
    @volunteer = User.find(params[:user_id])
    @talent = Talent.find(params[:talent_id])
  end
end
