require 'rails_helper'

RSpec.describe Reservation, type: :model do

  # Validations
  it 'has a valid factory' do
    expect(build(:reservation)).to be_valid
  end

  it { is_expected.to validate_presence_of :guest_name }
  it { is_expected.to validate_presence_of :size_code}

end
