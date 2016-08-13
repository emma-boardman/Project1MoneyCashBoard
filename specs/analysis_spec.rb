require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../models/analysis')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')

class TestAnalysis < Minitest::Test

  def setup


    @merchant1 = Merchant.new({'name' => 'Tesco', 'id' => 1})
    # @merchant1.id = 1
    @merchant2 = Merchant.new({'name' => 'ITunes', 'id' => 2})
    # @merchant2.id = 2
    @merchant3 = Merchant.new({'name' => 'Ikea', 'id' => 3})
    # @merchant3.id = 3
    @merchant4 = Merchant.new({'name' => 'Caffeine Drip', 'id' => 4})
    # @merchant4.id = 4
    @merchant5 = Merchant.new({'name' => 'Game', 'id' => 5})
    # @merchant5.id = 5
    @merchant6 = Merchant.new({'name' => 'Waterstones', 'id' => 6})
    # @merchant6.id = 6
    @merchant7 = Merchant.new({'name' => 'Amazon', 'id' => 7})
    # @merchant7.id = 7

    @tag1 = Tag.new({'tag' => 'Groceries', 'id' => 1})
    # @tag1.id = 1
    @tag2 = Tag.new({'tag' => 'Alcohol', 'id' => 2})
    # @tag2.id = 2
    @tag3 = Tag.new({'tag' => 'Tobacco', 'id' => 3})
    # @tag3.id = 3
    @tag4 = Tag.new({'tag' => 'Music', 'id' => 4})
    # @tag4.id = 4
    @tag5 = Tag.new({'tag' => 'Books', 'id' => 5})
    # @tag5.id = 5


    @transaction1 = Transaction.new({'amount' => '30', 'merchant_id' => @merchant1.id, 'tag_id' => @tag1.id, 'id' => 1 })
    # @transaction1.id = 1
    @transaction2 = Transaction.new({'amount' => '12', 'merchant_id' => @merchant2.id, 'tag_id' => @tag4.id, 'id' => 2 })
    # @transaction2.id = 2
    @transaction3 = Transaction.new({'amount' => '50', 'merchant_id' => @merchant7.id, 'tag_id' => @tag5.id, 'id' => 3 })
    # @transaction3.id = 3

    merchants = [@merchant1, @merchant2, @merchant3, @merchant4, @merchant5, @merchant6, @merchant7]
    tags = [@tag1, @tag2, @tag3, @tag4, @tag5]
    transactions = [@transaction1, @transaction2, @transaction3]

    @analysis = Analysis.new(merchants, tags, transactions)
  end

def test_total_expenditure()
  assert_equal(92, @analysis.total_expenditure)

end 


end