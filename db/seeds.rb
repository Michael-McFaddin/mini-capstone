# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Products.new({name: "Laptop Computer", price: 425, image_url: "https://assets.pcmag.com/media/images/530710-the-best-gaming-laptops-of-2017-january-2017-update-razer-blade-pro.jpg?thumb=y&width=767&height=431", description: "This is the newest HP Pavilion Notebook PC.", manual: "http://www.hp.com/ctg/Manual/bpi04347.pdf", specs: "Intel Core i7, AMD Radeon Graphics, 4GB RAM."})

product = Products.new({name: "Wireless Mouse", price: 24, image_url: "https://i5.walmartimages.com/asr/99775087-df08-4dae-82af-4cd401579c6b_1.b572153a3b3b183528e715c387adfa0c.jpeg", description: "Move that cursor around with style with the Logitech wireless mouse.", manual: "https://www.logitech.com/en-us/manuals/m335-setup-guide", specs: "Black color with rubber texture, usb dongle, runs on 1 AA battery."})
product.save
