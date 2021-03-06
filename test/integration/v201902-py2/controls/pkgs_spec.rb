version =
  case platform[:family]
  when 'redhat'
    '2019.2.0-1.el7'
  when 'fedora'
    '2019.2.0-1.fc30'
  when 'suse'
    '2019.2.0-lp151.5.3.1'
  when 'debian'
    '2019.2.0+ds-1'
  end

control 'salt packages' do
  title 'should be installed'

  %w(
    salt-master
    salt-minion
  ).each do |p|
    describe package(p) do
      it { should be_installed }
      its('version') { should eq version }
    end
  end
end
