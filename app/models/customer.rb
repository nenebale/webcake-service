class Customer < ActiveRecord::Base
  validates :uuid, :email, :uniqueness => true
  validates :uuid, :email, :presence => true
end
