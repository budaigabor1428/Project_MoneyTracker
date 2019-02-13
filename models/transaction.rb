require_relative('../db/sqlrunner')
require ('pry')

class Transaction

  attr_accessor :amount
  attr_reader :id

  def initialize (options)
    @id = options["id"].to_i if options["id"]
    @amount = options["amount"].to_f
    @merchant_id = options["merchant_id"].to_i
    @tag_id = options["tag_id"].to_i
  end

    def convert_to_pennies(amount)
      return amount * 100
    end

    def self.convert_to_pounds(amount)
      amount_pound = amount / 100
      amount_decimals = sprintf("%.2f", amount_pound)
      return amount_decimals
    end


    def save()
        sql = "INSERT INTO transactions (amount, merchant_id, tag_id) VALUES ($1, $2, $3) RETURNING id"
        values = [@amount, @merchant_id, @tag_id]
        results = SqlRunner.run(sql, values)
        @id = results.first()['id'].to_i
    end

    def self.delete_all()
        sql = "DELETE FROM transactions"
        SqlRunner.run(sql)
    end

    def self.all()
        sql = "SELECT * FROM transactions"
        results = SqlRunner.run(sql)
        return results.map { |transaction| Transaction.new(transaction)}
    end

    def self.find(id)
      sql = "SELECT * FROM transactions WHERE id = $1"
      values = [id]
      results = SqlRunner.run(sql, values)
      return Transaction.new(results.first)
    end

    def merchant()
      sql = "SELECT * FROM merchants
      WHERE id = $1"
      values = [@merchant_id]
      results = SqlRunner.run(sql, values)
      return Merchant.new(results.first)
    end

    def tag()
      sql = "SELECT * FROM tags
      WHERE id = $1"
      values = [@tag_id]
      results = SqlRunner.run(sql, values)
      return Tag.new(results.first)
    end

    def update()
      sql = "UPDATE transactions SET (amount, merchant_id, tag_id) = ($1, $2, $3)
      WHERE id = $4"
      values = [@amount, @merchant_id, @tag_id, @id]
      SqlRunner.run(sql, values)
    end

    def self.delete(id)
      sql = "DELETE FROM transactions
      WHERE id = $1"
      values = [id]
      SqlRunner.run(sql, values)
    end

    def self.total_spending()
      sql = "SELECT amount FROM transactions"
      results = SqlRunner.run(sql)
      transactions = results.map { |amount| Transaction.new(amount)}
      result = 0
        for transaction in transactions
          result += transaction.amount
        end
      return result
    end

end
