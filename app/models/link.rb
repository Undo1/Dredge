class Link < ActiveRecord::Base
  has_and_belongs_to_many :comments
end
