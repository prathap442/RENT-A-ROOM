#save is for both create and update equivalent
class Booking < ApplicationRecord
belongs_to :user
belongs_to :room
before_validation :check_valid_date
before_validation :logic_of_booking#this checks the logic
validate :set_is_confirmed_to_be_false, on: :create
validates_presence_of :start_date,:end_date,:user_id,:room_id
before_save :set_the_room_price

def set_the_room_price
    binding.pry
    self.price=((self.start_date..self.end_date).to_a.count)*(self.room.price)
    
end
def set_is_confirmed_to_be_false
     binding.pry
     self.is_confirmed = false
     binding.pry
end

def check_valid_date
  binding.pry
  if(self.start_date < Date.today)
      self.errors.add(:start_date,"this couldn't be possible as start date is lessthan todaydate")    
  end
   if(self.end_date<self.start_date)
     self.errors.add(:is_confirmed,"this couldn't be possible as start date is greater than enddate")
   end  
end 

def logic_of_booking
  	  Booking.where('end_date >= ? AND room_id = ?',Date.today, self.room_id).each do |bookdate|
  		binding.pry
	    if(((bookdate.start_date..bookdate.end_date).to_a.include? self.start_date)||((bookdate.start_date..bookdate.end_date).to_a.include? self.end_date))
        self.errors.add(:start_date, "this room is already booked by someone")
      binding.pry  
	    end
    end
end	
end
  