require 'rails/generators/active_record'

class SimpleAuthenticatorGenerator < ActiveRecord::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def add_user_migration_file
    migration_template "user_migration.rb", "db/migrate/create_user_table.rb"
  end

  def create_model
    copy_file 'user.rb', 'app/models/user.rb'
  end

  def create_model_spec
    copy_file 'user_spec.rb', 'spec/models/user_spec.rb'
  end

  def mount_engine 
    route "mount SimpleAuthenticator::Engine => '/simple_authenticator'"
  end
end
