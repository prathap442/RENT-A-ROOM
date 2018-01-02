class RoomsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  load_and_authorize_resource
  #url:localhost:3000/rooms
  #httpmethod :GET
  #roles and responsibilities :to create a index of the rooms and the attributes that it holds
  #path rooms_path
  def index
  @rooms=Room.paginate(:page => params[:page], :per_page => 3)
  binding.pry
  end
  #url:localhost:3000/rooms/new
  #path: new_room_path
  #rolesand responsibilities:to give the variable @room for which the attributes can be assigned
  #http method :GET
  def new
    @room=Room.new
    binding.pry
  end
  #http method:post 
  def create
    @room =Room.new(room_params)
    @room.user_id = current_user.id
    binding.pry
    if(@room.save)
      @room.user.update_attributes(role_id: Role.second.id)
      binding.pry
      redirect_to rooms_path
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
    @room=Room.find(params[:id])
  end

  def update
     @room=Room.find(params[:id])
    if(@room.update_attributes(room_params))
        redirect_to room_path(@room.id)
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
   params[:room].permit(:name,:description,:price,:rules,:address,:images,:latitude,:longitude,:city_id,amenity_ids:[])   
end	  
end
