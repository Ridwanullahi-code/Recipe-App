require 'rails_helper'

RSpec.describe Inventory, type: :model do
  subject { Inventory.new(name: 'Life') }

  before { subject.save }

  describe 'validate the user model' do
    it { should allow_value('Life').for(:name) }

    it 'All user attributes must be present' do
      expect(subject.name).to be_instance_of(String)
    end
  end

  describe 'check association' do
    it { should belong_to(:user) }
  end
end
