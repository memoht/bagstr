class ReservationPdf < Prawn::Document
  def initialize(reservation, view)
    super(top_margin: 50, page_size: 'A6')
    @reservation = reservation
    @view = view
    confirmation_number
    locker_no
    guest_info
    bagster_logo
  end

  def confirmation_number
    text "Reservation #{@reservation.id}", size: 12, style: :bold
    stroke_horizontal_rule
    move_down 5
    text "Confirmation No: #{@reservation.confirmation_no}", size: 12
  end

  def locker_no
    move_down 5
    text "Locker No: #{@reservation.locker_no}", size: 12, style: :normal
  end

  def guest_info
    move_down 15
    text "Guest", size: 12, style: :bold
    text  "Name: #{@reservation.guest_name}", size: 12, style: :normal
  end

  def bagster_logo
    bagster_logo = "#{Rails.root}/app/assets/images/lgo_bagster.png"
    image bagster_logo, :at => [0,380], :width => 30
  end
end
