require 'spec_helper'

describe Zipcode do
  it { should validate_presence_of :zip }
  it { should validate_presence_of :phzone }
end
