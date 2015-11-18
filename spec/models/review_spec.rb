require 'rails_helper'

describe Review do
  it { should belong_to :game }
  it { should validate_presence_of :author }
  it { should validate_presence_of :content }
end
