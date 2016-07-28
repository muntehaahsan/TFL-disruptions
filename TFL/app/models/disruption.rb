require 'nokogiri'
require 'open-uri'

class Disruption 
	
attr_accessor :id,:coordinate_log, :coordinate_lat

def self.all
   unless  Data.read.search('Disruptions').nil?
    Data.read.search('Disruption/CauseArea/DisplayPoint/Point/coordinatesLL').map do |coordinates|
	  new(coordinates.text)
  	end
   end
end

def initialize(coordinates)
    self.coordinate_log = coordinates.split(',')[0]
    self.coordinate_lat = coordinates.split(',')[1]
end

def persisted?
    false
end


module Data
    def self.read
       Nokogiri::XML(open("https://data.tfl.gov.uk/tfl/syndication/feeds/tims_feed.xml"))
    end
end

end

