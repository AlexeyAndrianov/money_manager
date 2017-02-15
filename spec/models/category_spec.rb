require 'spec_helper'

describe Category, type: :model do
  it { should belong_to(:user) }
end
