require 'rails/generators/active_record'

module Prague
  module Generators
    class ModelGenerator < ::ActiveRecord::Generators::Base
      desc 'This generator generates a model for pages'
      argument :name, default: 'Page'
      source_root File.expand_path('../templates', __FILE__)

      def create_migration
        migration_template 'migration.rb.erb', "db/migrate/prague_create_#{table_name}"
      end

      def create_model
        template 'model.rb.erb', "app/models/#{name}.rb"
      end
    end
  end
end
