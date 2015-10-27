FactoryGirl.define do

  factory :locker do
    locker_no "lg-1"
    size_code 3
    reserved false

  end

  factory :reservation do
    locker
    confirmation_no SecureRandom.uuid
    guest_name { FFaker::Name.name }
    size_code { [1, 2, 3].sample }
    status 'open'
  end
end
