# webapi_url.rb
require 'sinatra'
require 'sinatra/contrib'
require 'json'

users = {
    thibault: { first_name: 'Thibault', last_name: 'Denizet', age: 25 },
    simon: { first_name: 'Simon', last_name: 'Random', age: 26 },
    john: { first_name: 'John', last_name: 'Smith', age: 28 }
}

before do
  content_type 'application/json'
end

namespace '/v1' do
  get '/users' do
    users.map { |name, data| data }.to_json
  end
end

namespace '/v2' do
  get '/users' do
    users.map do |name, data|
      {
          full_name: "#{data[:first_name]} #{data[:last_name]}",
          age: data[:age]
      }
    end.to_json
  end
end