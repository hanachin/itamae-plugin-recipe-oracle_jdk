package 'wget'

work_dir = '/tmp/oracle_jdk'
directory work_dir do
  action :create
end

oracle_jdk_url = 'http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz'
filename       = File.basename(oracle_jdk_url)

execute 'download oracke jdk' do
  accept_header  = %("Cookie: oraclelicense=accept-securebackup-cookie")
  command "wget --header #{accept_header} #{oracle_jdk_url} -O #{filename}"
  cwd     work_dir
  not_if  "test -f #{work_dir}/#{filename}"
end
