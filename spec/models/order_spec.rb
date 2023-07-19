require 'rails_helper'
RSpec.describe Orders, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
end
