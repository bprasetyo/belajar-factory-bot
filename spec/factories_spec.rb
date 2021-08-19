require 'rails_helper'

FactoryBot.factories.map(&:name).each do |factory_name|
  describe "factory #{factory_name}" do
    it 'is valid' do
      factory = build(factory_name)
      result = factory.valid?
      expect(result).to eq true
    end
  end
end