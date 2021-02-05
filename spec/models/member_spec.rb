require 'rails_helper'

describe Member, type: :model do
  describe 'relationships' do
    it {should belong_to :location}
  end

  describe 'attributes' do
    it {should validate_presence_of :primary_member}
    it {should validate_presence_of :monthly_membership}
    it {should validate_presence_of :yearly_membership}
    it {should validate_presence_of :people_in_membership}
  end
end
