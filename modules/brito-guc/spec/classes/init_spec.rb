require 'spec_helper'
describe 'guc' do

  context 'with defaults for all parameters' do
    it { should contain_class('guc') }
  end
end
