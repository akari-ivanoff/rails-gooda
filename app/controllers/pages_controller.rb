class PagesController < ApplicationController
  def home
    @query = params[:query]
  end
end
