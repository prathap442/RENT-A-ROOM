class BookingsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = current_user.bookings
    binding.pry
    #@bookingsegregator = Booking.segregator
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @booking=Booking.find(params[:id])
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
    @booking=Booking.find(params[:id])
  end

  # POST /bookings
  # POST /bookings.json
  #@room=Room.find(params[:booking][:room_id])
    
  def create
    @booking = Booking.new(booking_params)
    @booking.user_id=current_user.id
     binding.pry
      if (@booking.save)
          binding.pry
             NotificationMailer.notification_two(@booking).deliver!
             NotificationMailer.notification_three(@booking).deliver!          
             redirect_to rooms_path,notice: "the room was successfully booked and a mail has beeb sent sayinng that booking is confirmed and needs to be authorized"
      else
          binding.pry
             render action: 'new'
          binding.pry
      end
  end 
  

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
         @booking=Booking.find(params[:id])
         @booking.update_attributes(booking_params)
         redirect_to rooms_path, notice: 'Booking was successfully updated.'   
    if(@booking.is_confirmed == true)
        NotificationMailer.notification_four(@booking).deliver! 
    end
    
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :user_id, :room_id, :is_confirmed, :price)
    end
end
