require 'nokogiri'
require 'open-uri'
class HomeController < ActionController::Base
  def show_map
  	disruption_coordinates = Disruption.all
        @hash = Gmaps4rails.build_markers(disruption_coordinates) do |disruption, marker|
  		marker.lat disruption.coordinate_lat
 		marker.lng disruption.coordinate_log
        end
  end
end


