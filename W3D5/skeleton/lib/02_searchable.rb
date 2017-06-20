require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_string = params.keys.map { |key| "#{key} = ?" }.join(' AND ') 

    DBConnection.execute(<<-SQL, *params.values)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        #{where_string}
    SQL
    .map { |params| new(params) }
  end
end

class SQLObject
  extend Searchable
end
