class InvitationsController < ApplicationController
  before_action :find_invitation, only: [:show, :edit, :update, :destroy]

  def index
    @invitations = Invitation.all
  end

  def show
  end

  def new
    @host = current_user
    @invitation = Invitation.new
  end

  def create
    @offer = Offer.find(params.dig(:invitation, :offer_id))
    @invitation = Invitation.new(invitation_params)
    @invitation.host = current_user
    if @invitation.save
      redirect_to dashboards_index_path
    else
      render 'offers/show'
    end
  end

  def edit
  end

  def update
    @invitation.host = current_user
    if @invitation.update(invitation_params)
      redirect_to dashboards_index_path
    else
      render :edit
    end
  end

  def destroy
    @host = @invitation.host
    @invitation.destroy
    redirect_to offers_path
  end

  private

  def invitation_params
    params.require(:invitation).permit(:title, :description, :status, :start_date, :end_date, :photo, :offer_id)
  end

  def find_invitation
    @invitation = Invitation.find(params[:id])
  end
end
