require 'fileutils'
require 'geocoder'




class Post < ApplicationRecord
  belongs_to :user
  belongs_to :socialmedia
  after_create :scam
  has_many :scams
  before_validation :wow
  def wow
    if !pic
      source= "public/birthdaycake.png"
      destination= "public/uploads/birthdaycake.png"
      FileUtils.cp(source, destination)
      write_attribute(:pic, "birthdaycake.png")
    end
  end
  def scam
    if content.downcase.include?("happy birthday")
      Scam.create(post: self, scammer_type: "date of birth", person_name: self.user.full_name, dateofbirth: self.user.dateofbirth, scammerdescription: "c'est un scam de la date de naissance")
    elsif content.downcase.include?("holiday")
      # Distance calculation using Haversine formula
      # Handles miles and kilometers
      
      # Method to calculate distance
      def haversine_distance(lat1, lon1, lat2, lon2, unit = 'km')
        # Validate inputs
        [lat1, lon1, lat2, lon2].each do |coord|
          unless coord.is_a?(Numeric) && coord.between?(-180, 180)
            raise ArgumentError, "Coordinates must be numeric and between -180 and 180 degrees"
          end
        end
      
        # Convert degrees to radians
        rad_lat1 = lat1 * Math::PI / 180
        rad_lon1 = lon1 * Math::PI / 180
        rad_lat2 = lat2 * Math::PI / 180
        rad_lon2 = lon2 * Math::PI / 180
      
        # Haversine formula
        dlat = rad_lat2 - rad_lat1
        dlon = rad_lon2 - rad_lon1
      
        a = Math.sin(dlat / 2)**2 +
            Math.cos(rad_lat1) * Math.cos(rad_lat2) * Math.sin(dlon / 2)**2
        c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
      
        # Earth radius in kilometers and miles
        radius_km = 6371.0
        radius_miles = 3958.8
      
        distance = unit.downcase == 'mi' ? radius_miles * c : radius_km * c
        distance
      end
      
      # Example usage
      begin
        p "list places"
        listplace=`python hello1.py "#{content.strip.squish.gsub("!",".")}"`
        x= JSON.parse(listplace.gsub("'",'"').squish)
        p x
        lat1, lon1 = self.user.lat.to_f, self.user.lon.to_s   # Paris

        x["hello"].each do |y|
          #lat2, lon2 = 40.7128, -74.0060 # New York
          lat2, lon2 = 181, 181 # New York
          results = Geocoder.search(y)

          if results.first
            lat2 = results.first.latitude
            lon2 = results.first.longitude
            coords = results.first.coordinates # Returns [lat, lon] array
          
            puts "Latitude: #{lat}, Longitude: #{lon}"
          end
      
          if lat2 != 181 and lon2 != 181 
            hello1=haversine_distance(lat1, lon1, lat2, lon2, 'km').round(2)

            puts "Distance in kilometers: #{haversine_distance(lat1, lon1, lat2, lon2, 'km').round(2)} km"

            hello2=haversine_distance(lat1, lon1, lat2, lon2, 'mi').round(2)
            puts "Distance in miles: #{haversine_distance(lat1, lon1, lat2, lon2, 'mi').round(2)} miles"
            if lat1 > 0 and lon1 > 0 and lat2.length > 0 and lon2.length > 0 and hello1.to_i > 10 or hello2.to_i > 10
              Scam.create(post: self, scammer_type: "location", person_name: self.user.full_name, dateofbirth: self.user.dateofbirth, moreinfo: "on social media, you're showing taht you're more than #{hello1} km far from home, you're giving more info to the hacker", current_place: y, scammerdescription: "dear hacker, i'm on holidays")
            elsif lat2.length > 0 and lon2.length > 0
              Scam.create(post: self, scammer_type: "location", person_name: self.user.full_name, dateofbirth: self.user.dateofbirth, moreinfo: "on social media , you're showing taht you're on holidays far from home, but you didn't say where you live", current_place: y, scammerdescription: "dear hacker, i'm on holidays")

            end
          elsif lat2 == 181 and lon2 == 181
            Scam.create(post: self, scammer_type: "location", person_name: self.user.full_name, dateofbirth: self.user.dateofbirth, moreinfo: "on social media , you're showing taht you're on holidays", current_place: y, scammerdescription: "dear hacker, i'm on holidays")

          end
        end

      rescue ArgumentError => e
        puts "Error: #{e.message}"
      end
    end
  end
  def pic=(uploaded_io)
    if uploaded_io
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    write_attribute(:pic, uploaded_io.original_filename)
    else
    write_attribute(:pic, "birthdaycake.png")
    end
  rescue => e
    write_attribute(:pic, "birthdaycake.png")
  end
  def pic
    read_attribute(:pic)

  end

end
