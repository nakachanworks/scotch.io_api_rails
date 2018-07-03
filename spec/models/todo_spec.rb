require 'rails_helper'

RSpec.describe Todo, type: :model do

  # Test suite for the Todo model
  # ensure Todo model has a 1:m relationship with the item model
  it { should have_many(:items).dependent(:destroy) }

  #validate: tests
  # ensure columns title & created_by are present bf saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }

end
