require 'rails_helper'

describe Game do
  it { should belong_to :genre }
  it { should belong_to :company}
  it { should validate_presence_of :title }
  it { should validate_presence_of :rating }
end
