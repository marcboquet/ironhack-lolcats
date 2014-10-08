class Owner < ActiveRecord::Base

  has_many :cats

  # Allow creation of nested models within this
  # (Allow creating cats)
  accepts_nested_attributes_for :cats
end
