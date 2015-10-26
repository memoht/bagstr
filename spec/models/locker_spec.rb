require 'rails_helper'

RSpec.describe Locker, type: :model do

  # Validations
  it 'has a valid factory' do
    expect(create(:locker)).to be_valid
  end

  it { is_expected.to validate_presence_of :locker_no }
  it { is_expected.to validate_presence_of :size_code}

end
