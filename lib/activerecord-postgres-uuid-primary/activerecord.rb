# Extends AR to add UUID functionality.
module ActiveRecord

  module ConnectionAdapters

    def self.Column
      if const_defined?('JdbcColumn')
        const_get('JdbcColumn')
      else
        const_get('Column')
      end
    end

    def self.Adapter
      if const_defined?('JdbcAdapter')
        const_get('JdbcAdapter')
      else
        const_get('AbstractAdapter')
      end
    end


    class PostgreSQLColumn < Column()
      # Adds the uuid type for the column.
      def simplified_type_with_uuid(field_type)
        field_type == 'uuid' ? :uuid : simplified_type_without_uuid(field_type)
      end

      alias_method_chain :simplified_type, :uuid
    end

    class PostgreSQLAdapter < Adapter()
      def native_database_types_with_uuid
        native_database_types_without_uuid.merge({:uuid => { :name => "uuid" }})
        native_database_types_without_uuid.merge(:primary_key => "uuid primary key default uuid_generate_v4()")
      end

      alias_method_chain :native_database_types, :uuid
    end

    class TableDefinition

      # Adds uuid type for migrations. So you can add columns to a table like:
      #   create_table :people do |t|
      #     ...
      #     t.uuid :other_model_id
      #     ...
      #   end
      def uuid(*args)
        options = args.extract_options!
        column_names = args
        column_names.each { |name| column(name, 'uuid', options) }
      end

    end

    class Table

      # Adds uuid type for migrations. So you can add columns to a table like:
      #   change_table :people do |t|
      #     ...
      #     t.uuid :other_model_id
      #     ...
      #   end
      def uuid(*args)
        options = args.extract_options!
        column_names = args
        column_names.each { |name| column(name, 'uuid', options) }
      end

    end
  end
end
