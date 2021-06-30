# inspec

## todo

- https://www.inspec.io/docs/reference/profiles/
- http://www.anniehedgie.com/inspec-basics-9
- http://www.anniehedgie.com/inspec-basics-10

### variables attributes

To options:

1. use one attribute file to reuse an existing profile for multiple notes -> one profile for many nodes
    - http://www.anniehedgie.com/inspec-basics-9
    - http://www.anniehedgie.com/inspec-basics-10
2. create a static attributes file and use with node profile -> one profile for one node
    - https://stackoverflow.com/questions/49042560/handling-attributes-in-inspec

#### use yaml to outsource static configuration

````text
With services.yml containing:

- service_name: httpd-alpha
  port: 80
- service_name: httpd-beta
  port: 8080
The tests in example.rb can now access this file:

my_services = yaml(content: inspec.profile.file('services.yml')).params

my_services.each do |s|
  describe service(s['service_name']) do
    it { should be_running }
end

describe port(s['port']) do
  it { should be_listening }
  end
end
```` 

#### merge ruby files

- https://stackoverflow.com/questions/5495786/rails-yml-merging/5495935

````bash
settings = YAML.load(path_to_settings)[RAILS_ENV].symbolize_keys
user_settings = YAML.load(path_to_user_settings)[RAILS_ENV].symbolize_keys
settings.merge!(user_settings)
````

## Alternatives

- https://github.com/ottomatica/opunit