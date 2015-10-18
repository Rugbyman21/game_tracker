require 'rails_helper'

describe Company do
  it { should have_many :game }
  it { should validate_presence_of :name }
  it { should validate_presence_of :country }
  it { should validate_presence_of :city }
  it { should validate_presence_of :address }
  it { should validate_presence_of :zip }
end
