class ReservationPdf < Prawn::Document
  def initialize(reservation, view)
    super(top_margin: 70, page_size: 'A6')
    @reservation = reservation
    @view = view
    confirmation_number
    locker_no
    guest_info
  end

  def confirmation_number
    text "Reservation \##{@reservation.id}", size: 14, style: :bold
    text @reservation.confirmation_no
  end

  def locker_no
    move_down 10
    text "Locker No: #{@reservation.locker_no}", size: 12, style: :normal
  end

  def guest_info
    move_down 15
    text "Guest", size: 12, style: :bold
    text  "Name: #{@reservation.guest_name}", size: 10, style: :normal
  end
end
