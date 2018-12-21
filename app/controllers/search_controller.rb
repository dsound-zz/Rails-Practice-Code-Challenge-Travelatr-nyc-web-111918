class SearchController < ApplicationController


  def index
    if params[:q]
      @results = Destination.all.select do |dest|
        dest.country.downcase.include?(params[:q].downcase.strip) ||
        dest.name.downcase.include?(params[:q].downcase.strip)
    
      end
    end
  end

end
