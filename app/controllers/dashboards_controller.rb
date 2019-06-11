class DashboardsController < ApplicationController
  def index
    @invitations_as_host = Invitation.all.select do |invitation|
      invitation.host.id == current_user.id
    end

    @invitations_as_volunteer = Invitation.all.select do |invitation|
      invitation.offer.volunteer.id == current_user.id
    end

  @invitations_as_host.sort_by{|invitation| invitation.status}
  @invitations_as_volunteer.sort_by{|invitation| invitation.status}

  end
end
