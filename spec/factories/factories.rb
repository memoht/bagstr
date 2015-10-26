FactoryGirl.define do

  factory :locker do
    locker_no "sm-1"
    size_code 1
    reserved false
  end

  factory :reservation do
    confirmation_no SecureRandom.uuid
    guest_name { FFaker::Name.name }
    size_code { [1, 2, 3].sample }
    status %w(flagged open closed).sample
    locker nil
  end
end
