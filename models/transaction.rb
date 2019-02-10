require_relative( '../db/sqlrunner' )

class Transaction

attr_accessor :amount
attr_reader :id

  def initialize (options)
    @id = options["id"].to_i if options['id']
    @amount = options["amount"].to_i
    @merchant_id = options["merchant_id"].to_i
    @tag_id = options["tag_id"].to_i
  end


end
