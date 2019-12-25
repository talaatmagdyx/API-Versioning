# webapi_parameter.rb
require 'sinatra'
require 'sinatra/contrib'
require 'json'

users = {
    thibault: { first_name: 'Thibault', last_name: 'Denizet', age: 25 },
    simon:    { first_name: 'Simon', last_name: 'Random', age: 26 },
    john:     { first_name: 'John', last_name: 'Smith', age: 28 }
}

before do
  content_type 'application/json'
end

helpers do
  def present_300
    {
        message: 'Multiple Versions Available (?version=)',
        links: {
            v1: '/users?version=v1',
            v2: '/users?version=v2'
        }
    }
  end

  def present_v2(data)
    {
        full_name: "#{data[:first_name]} #{data[:last_name]}",
        age: data[:age]
    }
  end
end

get '/users' do
  versions = {
      'v1' => ->(_name, data) { data },
      'v2' => ->(_name, data) { present_v2(data) }
  }

  unless params['version'] && versions.keys.include?(params['version'])
    halt 300, present_300.to_json
  end

  users.map(&versions[params['version']]).to_json
end