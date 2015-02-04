require 'rails_helper'
require 'my_math'

describe MyMath do
  describe '#add' do
    it 'is expected to exist' do
      is_expected.to respond_to(:add)
    end
    it {should respond_to(:add)}
    # it {is_expected.to respond_to(:add)}
    it 'should return correctly' do
      # MyMath.add(1,2).should == 3
      expect(MyMath.add(1,2)).to eq 3
    end
  end
end
