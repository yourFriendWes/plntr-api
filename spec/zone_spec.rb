require 'spec_helper'

describe Zone do
  it { should have_valid(:main_zone).when("14", "99") }
  it { should_not have_valid(:main_zone).when(nil, "", " ", "10", "-10", "10a") }
  it { should have_valid(:lowest_avg_temp_from).when(0, -12, 100) }
  it { should_not have_valid(:lowest_avg_temp_from).when(nil, "", " ") }
  it { should have_valid(:lowest_avg_temp_to).when(0, -12, 100) }
  it { should_not have_valid(:lowest_avg_temp_to).when(nil, "", " ") }
end
