class Website < ActiveRecord::Base
  belongs_to :customer
  
  validates_presence_of :uri
  validates_uniqueness_of :uri
  validates_format_of :uri, :with => /^(https?:\/\/)([\da-z\.-]+)\.([a-z\.]{2,6})$/
  
end