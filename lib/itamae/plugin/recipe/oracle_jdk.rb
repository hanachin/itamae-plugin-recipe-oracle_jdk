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

jdk_dir = '/opt/jdk'
directory jdk_dir do
  action :create
end

current_jdk_ver   = "jdk1.8.0_25"
jdk_installed_dir = "#{jdk_dir}/#{current_jdk_ver}"

execute 'extract oracle jdk' do
  command "tar zxvf #{filename} -C #{jdk_dir}"
  cwd     work_dir
  not_if  "test -d #{jdk_installed_dir}"
end

execute 'install oracke jdk' do
  command "update-alternatives --install /usr/bin/java java #{jdk_installed_dir}/bin/java 100"
  not_if "update-alternatives --display java | grep #{jdk_installed_dir}"
end
