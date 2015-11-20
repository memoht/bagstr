require 'rails_helper'

RSpec.describe Locker, type: :model do

  # Validations
  it 'has a valid factory' do
    expect(create(:locker)).to be_valid
  end

  it { is_expected.to validate_presence_of :locker_no }
  it { is_expected.to validate_presence_of :size_code}

  it 'is valid with a locker_no, and size_code' do
    locker = Locker.new(
      size_code: 3,
      locker_no: 'lg-1')
    expect(locker).to be_valid
  end

  it 'is invalid without a size_code' do
    locker = Locker.new(size_code: nil)
    locker.valid?
    expect(locker.errors[:size_code]).to include("can't be blank")
  end

  it 'is invalid without a locker_no' do
    locker = Locker.new(locker_no: nil)
    locker.valid?
    expect(locker.errors[:locker_no]).to include("can't be blank")
  end

  it 'is invalid with a duplicate locker_no' do
    locker = Locker.create(
      size_code: 3,
      locker_no: 'lg-1')
    locker = Locker.new(
      size_code: 3,
      locker_no: 'lg-1'
    )
    locker.valid?
    expect(locker.errors[:locker_no]).to include("has already been taken")
  end
end
