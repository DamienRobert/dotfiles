package 'nginx'

service 'nginx' do
  action [:enable, :start]
end

file 'motd' do
  content 'hello world'
end
