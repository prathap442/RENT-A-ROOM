class Booking < ApplicationRecord
belongs_to :user
belongs_to :room
validates_presence_of :start_date,:end_date,:user_id,:room_id
before_validation :set_is_confirmed_to_be_false, on: :create

def set_is_confirmed_to_be_false
     binding.pry
     self.is_confirmed = false
     binding.pry
end
  def logic_of_booking(room)
  	@count=0
  	@@bookings_ranges=[]
  	  Booking.all.where(room_id:room.id).each do |bookdate|
  		binding.pry
	    @@bookings_ranges.push((bookdate.start_date)..(bookdate.end_date))
	    end 
	 if(@@bookings_ranges.empty?)
		binding.pry
		      if((self.start_date > Date.today)&&(self.end_date >= self.start_date))
		 	       binding.pry
             @@bookings_ranges.push((self.start_date)..(self.end_date))    
          end
   else
    	 @@bookings_ranges.each do |range|
             binding.pry
             if ( range.include? (self.start_date)||(range.include?(self.end_date)) )||(self.start_date<Date.today)||(self.start_date>self.end_date)
             	 binding.pry
    	          return -1
    	            break
    	     else
    	     	   binding.pry
    	     	   @count+=1
    	     end
    	 end
    	 #this is like if ithis is not included in this 
       ##if(@@count=bookings_ranges.count)#so it tells that the search has found no where in those ranges so its count got increamented . if this increamentaion is equal to the length of bookings_ranges.then the no room is said to be booked
   end
    @count=0
  end	

  def segregator
    @present=[]
    @past=[]
    @future=[]
     Booking.all.each do |booking|
        if(booking.user_id==current_user.id)
             if(booking.start_date>Date.today)
                 @future.push(booking)
             elsif((booking.start_date<Date.today)&&(booking.end_date>Date.today))
                 @present.push(booking)
             else
                 @past.push(booking)
             end
        end
     end
     return Array.new.push(@present,@past,@future)       
  end  
end
