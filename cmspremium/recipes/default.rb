template "#/tmp/#test.txt" do
  
  owner 'root'
  group 'root'
  mode     '0755'
  source   'test.erb'

  variables(
    :mystring => (node["cmspremium"]["test"]["first"]  rescue 'failed to get string')
  )

end