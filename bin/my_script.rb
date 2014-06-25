require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: "http",
  host: 'localhost',
  port: 3000,
  path: '/users',
).to_s

puts RestClient.post(url, user: {username: "Emmett"})

url = Addressable::URI.new(
  scheme: "http",
  host: 'localhost',
  port: 3000,
  path: '/users',
).to_s

puts RestClient.post(url, user: {username: "Gerald"})

url = Addressable::URI.new(
  scheme: "http",
  host: 'localhost',
  port: 3000,
  path: '/users',
).to_s

puts RestClient.get(url)

url = Addressable::URI.new(
  scheme: "http",
  host: 'localhost',
  port: 3000,
  path: '/users/1/contacts',
).to_s

puts RestClient.post(url, contact: {
  name: "Buck",
  email: "buck@buck.com",
  user_id: 1})

  url = Addressable::URI.new(
    scheme: "http",
    host: 'localhost',
    port: 3000,
    path: '/users/1/contacts',
  ).to_s

  puts RestClient.get(url)

  url = Addressable::URI.new(
    scheme: "http",
    host: 'localhost',
    port: 3000,
    path: '/users/1/contacts/1',
  ).to_s

  puts RestClient.patch(url, contact: {
    name: "Buck",
    email: "buck@gmail.com",
    user_id: 1})

    url = Addressable::URI.new(
      scheme: "http",
      host: 'localhost',
      port: 3000,
      path: '/users/1/contacts/1',
    ).to_s

    puts RestClient.patch(url, contact: {
      name: "Buck",
      email: "buck@gmail.com",
      user_id: 1})
#
#
#
#
#
#