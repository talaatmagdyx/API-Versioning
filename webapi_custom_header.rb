# webapi_custom_header.rb
require 'sinatra'
require 'json'

users = {
    thibault: { first_name: 'Thibault', last_name: 'Denizet', age: 25 },
    simon:    { first_name: 'Simon', last_name: 'Random', age: 26 },
    john:     { first_name: 'John', last_name: 'Smith', age: 28 }
}

helpers do
  def present_v2(data)
    {
        full_name: "#{data[:first_name]} #{data[:last_name]}",
        age: data[:age]
    }
  end
end

before do
  content_type 'application/json'
end

get '/users' do
  if request.env['HTTP_VERSION'] == '2.0'
    halt 200, users.map { |_name, data| present_v2(data) }.to_json
  end
  users.map { |_name, data| data }.to_json
end