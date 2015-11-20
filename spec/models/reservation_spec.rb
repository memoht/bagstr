require 'rails_helper'

RSpec.describe Reservation, type: :model do

  # Validations
  it 'has a valid factory' do
    expect(create(:reservation)).to be_valid
  end

  it { is_expected.to validate_presence_of :guest_name }
  it { is_expected.to validate_presence_of :size_code }

  it 'is invalid without a guest_name' do
    expect(build(:reservation, guest_name: nil)).to_not be_valid
  end

  it 'is invalid without a size_code' do
    expect(build(:reservation, size_code: nil)).to_not be_valid
  end

end
