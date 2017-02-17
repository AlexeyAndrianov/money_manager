require 'spec_helper'

describe User, type: :model do
  it { should have_one(:balance) }
  it { should have_many(:categories) }
end
