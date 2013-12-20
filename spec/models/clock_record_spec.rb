require 'spec_helper'

describe ClockRecord do
  before do
    @in_record = create(:clock_record_in)
    @out_record = create(:clock_record_out)
  end

  it 'should answer properly for clocked_in?' do
    @in_record.clocked_in?.should == true
    @out_record.clocked_in?.should == false
  end
end
