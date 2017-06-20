require_relative 'db_connection'
require_relative '03_associatable'

# Phase IV
module Associatable
  def has_one_through(name, through_name, source_name)
    define_method(name) do
      # Get options from through object
      through_options = self.class.assoc_options[through_name]
      # Get options from source object, using through object
      source_options = through_options.model_class.assoc_options[source_name]

      # Through table name
      through_table = through_options.table_name
      # Source table name
      source_table = source_options.table_name
      # Foreign key between through and source objects
      through_source_fk = source_options.foreign_key

      # Drop some SQL
      # FIXME: Can't figure out what connection to make here
      self.class.parse_all(DBConnection.execute(<<-SQL, send(through_options.foreign_key))
        SELECT
          #{source_table}.*
        FROM
          #{through_table}
        JOIN
          #{source_table} ON #{through_table}.#{through_source_fk} = #{source_table}.id
        WHERE
          #{through_table}.id = ?
      SQL
      ).first
    end
  end
end
