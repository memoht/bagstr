class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = Reservation.text_search(params[:query]).page(params[:page])
    @open_lockers = Locker.available
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReservationPdf.new(@reservation, view_context)
        send_data pdf.render, filename: "reservation_#{@reservation.id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  def new
    @reservation = Reservation.new
  end

  def edit
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to @reservation, flash: { success: t('flashes.created') }
    else
      flash[:alert] = "Error(s): " + @reservation.errors.full_messages.join(' • ')
      render :new
    end
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to @reservation, notice: t('flashes.updated')
    else
      flash[:alert] = "Error(s): " + @reservation.errors.full_messages.join(' • ')
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_url, alert: t('flashes.terminated')
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # whitelist parameters.
  def reservation_params
    params.require(:reservation).permit(:confirmation_no, :guest_name, :size_code)
  end
end
