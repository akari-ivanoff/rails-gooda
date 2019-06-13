class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @talents = Talent.all
    @query = params[:query]
  end
end
