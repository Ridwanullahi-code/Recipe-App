require 'rails_helper'

time = Time.now
tm = time.to_formatted_s(:time)

RSpec.describe Recipe, type: :model do
  subject do
    Recipe.new(name: 'Noddle', preparation: tm,
               cooking: tm, description: 'Very nice to have', public: true)
  end

  before { subject.save }

  describe 'validate the user model' do
    it { should allow_value('Noddle').for(:name) }
    it { should allow_value(tm).for(:preparation) }
    it { should allow_value(tm).for(:cooking) }

    it 'All user attributes must be present' do
      expect(subject.name).to eq('Noddle')
      expect(subject.description).to eq('Very nice to have')
      expect(subject.public).to be(true)
    end

    describe 'check association' do
      it { should belong_to(:user) }
      it { should have_many(:recipe_foods) }
    end
  end
end
