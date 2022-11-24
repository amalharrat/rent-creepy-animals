class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new(booking_params)

    @booking.animal = @animal
    @booking.user = current_user
    if @booking.save
      redirect_to animal_bookings_path(@animal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    if @booking
      redirect_to animal_bookings_path(@animal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @animal = @booking.animal
    @booking.destroy
    redirect_to animal_bookings_path(@animal), status: :see_other
  end

  def my_bookings
    # index
    @mybookings = current_user.bookings
  end

  def booking_validation

  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date)
  end
end
