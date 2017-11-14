require "rails_helper"

describe Lesson do
  it { should validate_presence_of :name }
  it { should validate_presence_of :content }
  it { should validate_presence_of :order }
  it { should belong_to :section }
  it { should validate_presence_of :section }
end
