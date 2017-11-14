require "rails_helper"

describe Section do
  it { should validate_presence_of :name }
  it { should validate_presence_of :order }
  it { should belong_to :course }
  it { should validate_presence_of :course }
  it { should have_many :lessons }
end
