require 'spec_helper'

describe User do

  context "schema" do
    it { should have_db_column(:email) }
    it { should have_db_column(:password_digest) }
  end

  context 'validations' do 
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_confirmation_of(:password) }
    it { should have_secure_password }
  end
end

