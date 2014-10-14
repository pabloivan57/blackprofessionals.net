require 'spec_helper'

describe User do

  describe '#location' do
    let(:user) { create(:user, country: 'United States',
                               city:    'Los Angeles') }

    it 'should return a combination of country and city' do
      expect(user.location).to eq('United States, Los Angeles')
    end
  end
end
