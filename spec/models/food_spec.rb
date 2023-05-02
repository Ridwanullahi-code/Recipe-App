require 'rails_helper'

RSpec.describe Food, type: :model do
  subject { Food.new(name: 'Rice and Beans', measurement: 'kg', price: 20.23) }

  before { subject.save }

  describe 'validate the user model' do
    it { should allow_value('Rice and Beans').for(:name) }
    it { should allow_value('kg').for(:measurement) }
    it { should allow_value(20.23).for(:price) }

    it { should have_db_column(:price).of_type(:decimal) }

    it 'All user attributes must be present' do
      expect(subject.name).to be_instance_of(String)
      expect(subject.measurement).to be_instance_of(String)
    end

    describe 'check association' do
      it { should have_many(:inventory_foods) }
      it { should have_many(:recipe_foods) }
    end
  end
end
