require "http"

puts "Is this thing on?"

response = HTTP.get("http://localhost:3000/api/products")