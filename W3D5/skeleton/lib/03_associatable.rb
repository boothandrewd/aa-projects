require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    @class_name.constantize
  end

  def table_name
    return 'humans' if @class_name == 'Human'   # NOTE: Edge case
    @class_name.underscore.pluralize
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    defaults = {
      primary_key: :id,
      foreign_key: :"#{name.to_s.underscore}_id",
      class_name: name.to_s.camelcase
    }

    defaults.merge(options).each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    defaults = {
      primary_key: :id,
      foreign_key: :"#{self_class_name.to_s.underscore}_id",
      class_name: name.to_s.singularize.camelcase
    }

    defaults.merge(options).each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    assoc_options[name] = options
    define_method(name) do
      options.model_class.where(options.primary_key => send(options.foreign_key)).first
    end
  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, self.name, options)
    define_method(name) do
      options.model_class.where(options.foreign_key => send(options.primary_key))
    end
  end

  def assoc_options
    @assoc_options ||= {}
  end
end

class SQLObject
  extend Associatable
end
