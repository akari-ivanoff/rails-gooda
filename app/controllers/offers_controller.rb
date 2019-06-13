class OffersController < ApplicationController
  before_action :find_offer, only: [:show, :edit, :update, :destroy]
  before_action :find_volunteer, only: [:new, :create, :update]
  before_action :find_talent, only: [:create, :update]

  def index
    query = params[:query]
    @offers = query.present? ? Offer.global_search(query) : Offer.all
  end

  def show
    @invitation = Invitation.new
    @invitation.offer = @offer
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.volunteer = @volunteer
    @offer.talent = @talent
    if @offer.save
      # redirect_to user_path(@volunteer)
      redirect_to offer_path(@offer)
    else
      # render 'users/show'
      render :new
    end
  end

  def edit
  end

  def update
    @offer.volunteer = @volunteer
    @offer.talent = @talent
    if @offer.update(offer_params)
      # redirect_to user_path(@volunteer)
      redirect_to offer_path(@offer)
    else
      # render 'users/show'
      render :edit
    end
  end

  def destroy
    @volunteer = @offer.volunteer
    @offer.destroy
    redirect_to offers_path
  end

  private

  def offer_params
    params.require(:offer).permit(:comment, :talent_id)
  end

  def find_offer
    @offer = Offer.find(params[:id])
  end

  def find_volunteer
    @volunteer = current_user
  end

  def find_talent
    @talent = Talent.find(params.dig(:offer, :talent_id))
  end
end
