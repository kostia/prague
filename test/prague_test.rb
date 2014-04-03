require 'test_helper'

class PragueTest < ActiveSupport::TestCase
  def test_app_dir
    File.expand_path '../dummy', __FILE__
  end

  def in_test_app
    Dir.chdir test_app_dir { yield }
  end

  def generate(args)
    in_test_app { sh "bundle exec rails g prague:#{args}" }
  end

  def generate_scaffold(name = nil)
    generate "scaffold #{name}"
  end

  test 'can call generator' do
    generate_scaffold
  end
end
