class PagesController < ApplicationController
  def home
    @talents = Talent.all
    @query = params[:query]
  end
end
