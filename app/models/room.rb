class Room < ApplicationRecord
belongs_to :user
belongs_to :city
has_many :amenity_rooms
has_many :amenities,through: :amenity_rooms
validates_presence_of :name,:description,:price,:rules,:address	,:images,:city_id,:user_id
mount_uploader :images, CoverUploader
after_create :assign_the_lat_and_lon_magnitudes
#usage of the callback
before_create :assign_the_role_of_guest_to_host
 def assign_the_role_of_guest_to_host 
   self.user.update_attributes(role_id: Role.second.id)
 end
 def assign_the_lat_and_lon_magnitudes
     binding.pry
     response=HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{self.address}&key=AIzaSyBAmEU8JjAreoouKtDoxZcGvggs0rxa6T8")
     self.update_attributes(latitude:response.parsed_response["results"][0]["geometry"]["location"]["lat"].to_f)
     self.update_attributes(longitude:response.parsed_response["results"][0]["geometry"]["location"]["lng"].to_f)
     binding.pry
 end
 
end
