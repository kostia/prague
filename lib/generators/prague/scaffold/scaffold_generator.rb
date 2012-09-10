module Prague
  module Generators
    class ScaffoldGenerator < ::Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers

      desc 'This generator generates a scaffold for pages'
      argument :name, default: 'page'
      source_root File.expand_path('../templates', __FILE__)

      def create_model_and_migration
        invoke 'prague:model', [singular_name]
      end

      def create_controller
        generate 'scaffold_controller', singular_name.classify +
            ' title permalink link_title sort_value head:text body:text online:boolean'
        inject_into_class "app/controllers/#{plural_name}_controller.rb",
            "#{controller_class_name}Controller", erb('action.rb.erb')
      end

      def create_display_view
        template 'view.html.erb.erb', "app/views/#{plural_name}/display.html.erb"
      end

      def add_display_link_to_show_view
        append_to_file "app/views/#{plural_name}/show.html.erb",
            "| <%= link_to 'Display', display_#{singular_name}_path(permalink: @#{singular_name}.permalink) %>"
      end

      def add_meta_tags_to_application_layout
        gsub_file 'app/views/layouts/application.html.erb', '</head>',
            "  <%= content_for :meta_tags if content_for? :meta_tags %>\n</head>"
      end

      def create_display_helper
        template 'helper.rb.erb', "app/helpers/#{plural_name}_display_helper.rb"
      end

      def add_routes
        route "\n  resources :#{plural_name}"
        gsub_file 'config/routes.rb', /end\Z/,
            "\n  match ':permalink' => '#{plural_name}#display', as: 'display_#{singular_name}'\nend"
      end

      private

      def erb(source)
        ERB.new(File.read File.expand_path(find_in_source_paths(source))).result binding
      end
    end
  end
end
