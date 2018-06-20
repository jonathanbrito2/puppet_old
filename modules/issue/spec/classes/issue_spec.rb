require 'spec_helper'

describe 'issue', :type => :class do
  context 'with file => dummy' do
    let(:params) { {:source => 'dummy'} }
    it {
      should contain_file('/etc/issue').with({
        'ensure' => 'file',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
        'source' => 'dummy'
      })
      should contain_file('/etc/issue.net').with({
        'ensure' => 'file',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
        'source' => 'dummy'
      })
    }
  end
end