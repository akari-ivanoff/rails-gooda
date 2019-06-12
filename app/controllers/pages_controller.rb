class PagesController < ApplicationController
  def home
    @talents = Talent.all
  end
end
