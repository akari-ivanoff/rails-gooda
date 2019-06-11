class InvitationsController < ApplicationController
  before_action :find_invitation, only: [:edit, :update, :destroy]
  before_action :find_host_and_offer, only: [:create, :update]

  def index
    @host = User.find(params[:user_id])
    @offer = Offer.find(params[:offer_id])
    @invitations = Invitation.all
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.host = @host
    @invitation.offer = @offer
    if @invitation.save
      redirect_to invitation_path(@invitation)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @invitation.host = @host
    @invitation.offer = @offer
    if @invitation.update(invitation_params)
      redirect_to invitation_path(@invitation)
    else
      render :edit
    end
  end

  def destroy
    @host = @invitation.host
    @invitation.destroy
    redirect_to user_path(@host)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:title, :description, :status, :start_date, :end_date, :photo)
  end

  def find_invitation
    @invitation = Invitation.find(params[:id])
  end

  def find_host_and_offer
    @host = User.find(params[:user_id])
    @offer = Offer.find(params[:offer_id])
  end
end
