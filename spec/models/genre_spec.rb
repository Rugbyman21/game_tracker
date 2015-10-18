require 'rails_helper'

describe Genre do
  it { should have_many :game }
  it { should validate_presence_of :name }
end
