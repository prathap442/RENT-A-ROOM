class RoomsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource 
  #url:localhost:3000/rooms
  #httpmethod :GET
  #roles and responsibilities :to create a index of the rooms and the attributes that it holds
  #path rooms_path
  def index
      binding.pry
      @rooms=Room.paginate(:page => params[:page], :per_page => 3)
      binding.pry
  end
  #url:localhost:3000/rooms/new
  #path: new_room_path
  #rolesand responsibilities:to give the variable @room for which the attributes can be assigned
  #http method :GET
  def new
    binding.pry
    @room=Room.new
  end
  #http method:post 
  def create
    @room =Room.new(room_params)
    @room.user_id = current_user.id
    
    binding.pry
    if(@room.save)
      if(@room.user_id != 1)     
         @room.user.update_attributes(role_id: Role.second.id)
         binding.pry
         redirect_to rooms_path
      else
         redirect_to rooms_path
      end
    else  
      binding.pry 
      render action: 'new'
    end  
  end   


  def edit
    @room=Room.find(params[:id])
   binding.pry
  end

  def show
    @booking=Booking.new
    @room=Room.find(params[:id])
    @booking.room_id = @room.id
  end

  def update
     @room=Room.find(params[:id])
    if(@room.update_attributes(room_params))
        redirect_to room_path(@room.id)
        
        NotificationMailer.authorization_message_sending(@room).deliver!
    else
         render action: 'edit'
    end
  end
  def destroy
    @room=Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end  

private
def room_params
   params[:room].permit(:name,:description,:price,:rules,:address,:images,:latitude,:longitude,:city_id,:is_authorized,amenity_ids:[])   
end	  
end
