require 'rails_helper'

describe Location, type: :model do
  describe 'relationships' do
    it {should have_many :members}
  end

  describe 'attributes' do
    it {should validate_presence_of :city}
    it {should validate_presence_of :square_footage}
    # it {should validate_presence_of :lead_wall}
  end
end
