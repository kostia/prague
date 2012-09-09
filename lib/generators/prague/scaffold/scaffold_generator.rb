module Prague
  module Generators
    class ScaffoldGenerator < ::Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers

      desc 'This generator generates a scaffold for pages'
      argument :name, default: 'Page'
      source_root File.expand_path('../templates', __FILE__)

      def create_model_and_migration
        invoke 'prague:model', [singular_name]
      end

      def create_controller
        invoke 'scaffold_controller', [singular_name.classify]
        inject_into_class "app/controllers/#{plural_name}_controller.rb",
            "#{controller_class_name}Controller", erb('action.rb.erb')
      end

      def create_display_view
        template 'view.html.erb.erb', "app/views/#{plural_name}/display.html.erb"
      end

      def create_display_helper
        template 'helper.rb.erb', "app/helpers/#{plural_name}_display_helper.rb"
      end

      def add_routes
        route erb('route.rb.erb')
        gsub_file 'config/routes.rb', /end\Z/,
            "\n  match ':permalink' => '#{plural_name}#display'\nend"
      end

      private

      def erb(source)
        ERB.new(File.read File.expand_path(find_in_source_paths(source))).result binding
      end
    end
  end
end
