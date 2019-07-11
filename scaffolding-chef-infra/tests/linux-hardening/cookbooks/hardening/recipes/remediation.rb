package "rsyslog"

case node['platform']
when 'debian', 'ubuntu'
  apt_update
  package "auditd"
  package 'haveged'
when 'redhat', 'centos', 'fedora', 'amazon'
  package "audit"
end

cookbook_file "/etc/audit/auditd.conf" do
  source "auditd.conf"
end
