require 'addressable/uri'
require 'rest-client'

# url = Addressable::URI.new(
#   scheme: "http",
#   host: 'localhost',
#   port: 3000,
#   path: '/users',
# ).to_s
#
# puts RestClient.post(url, user: {username: "Gmoney"})
#
#
# url = Addressable::URI.new(
#   scheme: "http",
#   host: 'localhost',
#   port: 3000,
#   path: '/users/1/contacts',
# ).to_s
#
# puts RestClient.post(url, contact: {
#     name: "Teemo",
#     email: "mushrooms@lol.com",
#     user_id: 1}
#   )
#
#
#
#
url = Addressable::URI.new(
  scheme: "http",
  host: 'localhost',
  port: 3000,
  path: '/users/2/contacts/'
).to_s




a = JSON.parse(RestClient.get(url))
a.each {|cont| puts cont}
