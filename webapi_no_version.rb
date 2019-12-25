# webapi_no_version.rb
require 'sinatra'
require 'json'

users = {
    thibault: { first_name: 'Thibault', last_name: 'Denizet', age: 25 },
    simon: { first_name: 'Simon', last_name: 'Random', age: 26 },
    john: { first_name: 'John', last_name: 'Smith', age: 28 }
}

helpers do

  def present_user(data)
    {
        full_name: "#{data[:first_name]} #{data[:last_name]}",
        age: data[:age],
        first_name: data[:first_name],
        last_name: data[:last_name]
    }
  end

end

get '/users' do
  media_type = request.accept.first.to_s
  unless %w[*/* application/* application/json].include?(media_type)
    halt 406
  end

  content_type 'application/json'
  users.map { |_name, data| present_user(data) }.to_json
end