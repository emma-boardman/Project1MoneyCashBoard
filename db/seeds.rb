require('pry-byebug')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')

Merchant.delete_all()
Tag.delete_all()
Transaction.delete_all()

merchant1 = Merchant.new({'name' => 'Tesco'})
merchant2 = Merchant.new({'name' => 'ITunes'})
merchant3 = Merchant.new({'name' => 'Ikea'})
merchant4 = Merchant.new({'name' => 'Caffeine Drip'})
merchant5 = Merchant.new({'name' => 'Game'})
merchant6 = Merchant.new({'name' => 'Waterstones'})
merchant7 = Merchant.new({'name' => 'Amazon'})

merchant1.save
merchant2.save
merchant3.save
merchant4.save
merchant5.save
merchant6.save
merchant7.save


tag1 = Tag.new({'tag' => 'Groceries'})
tag2 = Tag.new({'tag' => 'Alcohol'})
tag3 = Tag.new({'tag' => 'Tobacco'})
tag4 = Tag.new({'tag' => 'Music'})
tag5 = Tag.new({'tag' => 'Books'})

tag1.save
tag2.save
tag3.save
tag4.save
tag5.save

transaction1 = Transaction.new({'amount' => '30', 'merchant_id' => merchant1.id, 'tag_id' => tag1.id })
transaction2 = Transaction.new({'amount' => '12', 'merchant_id' => merchant2.id, 'tag_id' => tag4.id })
transaction3 = Transaction.new({'amount' => '50', 'merchant_id' => merchant7.id, 'tag_id' => tag5.id })
transaction4 = Transaction.new({'amount' => '23', 'merchant_id' => merchant2.id, 'tag_id' => tag4.id })
transaction5 = Transaction.new({'amount' => '9', 'merchant_id' => merchant1.id, 'tag_id' => tag5.id })
transaction6 = Transaction.new({'amount' => '10', 'merchant_id' => merchant7.id, 'tag_id' => tag1.id })

transaction1.save
transaction2.save
transaction3.save
transaction4.save
transaction5.save
transaction6.save


binding.pry
nil