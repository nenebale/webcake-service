class Customer < ActiveRecord::Base
  
  has_many :websites
  
  validates :uuid, :email, :presence => true
  validates :uuid, :email, :uniqueness => true
  validates_format_of :email, :with => /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
  
end
