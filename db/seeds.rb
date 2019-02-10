require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb" )
require_relative( "../models/transaction.rb" )
require("pry-byebug")

Transaction.delete_all()
Merchant.delete_all()
Tag.delete_all()

merchant_1 = Merchant.new({
  "name" => "Tesco"
  })

merchant_2 = Merchant.new({
  "name" => "Lothian Buses"
})

merchant_1.save()
merchant_2.save()

tag_1 = Tag.new({
  "name" => "Food"
  })

tag_2 = Tag.new({
  "name" => "Travel"
  })

tag_1.save()
tag_2.save()

transaction_1 = Transaction.new({
  "amount" => 10,
  "merchant_id" => merchant_1.id,
  "tag_id" => tag_1.id
  })

transaction_2 = Transaction.new({
    "amount" => 8,
    "merchant_id" => merchant_2.id,
    "tag_id" => tag_2.id
    })

transaction_1.save()
transaction_2.save()

binding.pry
nil
