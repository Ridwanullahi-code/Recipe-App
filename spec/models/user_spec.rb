require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Ridwan', email: 'ridwan@gmail.com', password: 'olalekan') }
  before { subject.save }

  describe 'validate the user model' do
    it { should allow_value('Ridwan').for(:name) }
    it { should validate_presence_of(:email) }
    it { should_not allow_value(nil, '').for(:email) }
    it { should allow_value(:password).for(:password) }

    it 'All user attributes must be present' do
      expect(subject.name).to eq('Ridwan')
      expect(subject.email).to eq('ridwan@gmail.com')
      expect(subject.password).to eq('olalekan')
    end

    describe 'check association' do
      it { should have_many(:inventories) }
      it { should have_many(:recipes) }
    end
  end
end
