require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: "http",
  host: 'localhost',
  port: 3000,
  path: '/users/3',
).to_s
   
puts url
puts RestClient.put(url, user: {name: "Emmett", email: "emmett@gmail.com"} )