require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @columns ||= DBConnection.execute2("SELECT * FROM #{table_name}").first.map(&:to_sym)
  end

  def self.finalize!
    columns.each do |column_name|
      define_method("#{column_name}") { attributes[column_name] }
      define_method("#{column_name}=") { |arg| attributes[column_name] = arg }
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= name.tableize
  end

  def self.all
    parse_all(DBConnection.execute("SELECT #{table_name}.* FROM #{table_name}"))
  end

  def self.parse_all(results)
    results.map do |params|
      new(params)
    end
  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL, id)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        #{table_name}.id = ?
    SQL
    parse_all(results).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      unless self.class.columns.include?(attr_name.to_sym)
        raise "unknown attribute '#{attr_name}'"
      end
      send(:"#{attr_name}=", value)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map do |column_name|
      send(column_name)
    end
  end

  def insert
    col_names = self.class.columns.join(', ')
    question_marks = Array.new(self.class.columns.count, '?').join(', ')

    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    attributes[:id] = DBConnection.last_insert_row_id
  end

  def update
    set_string = self.class.columns.map { |col| "#{col} = ?" }.join(', ')

    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_string}
      WHERE
        id = ?
    SQL
  end

  def save
    id.nil? ? insert : update
  end
end
