require_relative('../db/sqlrunner')

class Tag

attr_accessor :name
attr_reader :id

  def initialize (options)
    @id = options["id"].to_i if options['id']
    @name = options["name"]
  end

    def save()
        sql = "INSERT INTO tags
        (
          name
        )
        VALUES
        (
          $1
        )
        RETURNING id"
        values = [@name]
        results = SqlRunner.run(sql, values)
        @id = results.first()['id'].to_i
    end

    def self.delete_all
        sql = "DELETE FROM tags"
        SqlRunner.run(sql)
    end

    def self.all()
        sql = "SELECT * FROM tags"
        results = SqlRunner.run(sql)
        return results.map { |tag| Tag.new(tag)}
    end

    def self.find(id)
      sql = "SELECT * FROM tags
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run(sql, values)
      return Tag.new(results.first)
    end

    def merchant()
      sql = "SELECT * FROM merchants
      WHERE id = $1"
      values = [@merchant_id]
      results = SqlRunner.run(sql, values)
      return Merchant.new(results.first)
    end

    def update()
      sql = "UPDATE tags SET (name) = ($1) WHERE id = $2"
      values = [@name, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM tags
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

end
