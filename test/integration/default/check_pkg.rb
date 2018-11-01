describe command('terraform apply') do
  its(:stdout) { should_not match "nil" } 
  its(:stdout) { should_not match "127.0.0.1" }
end
