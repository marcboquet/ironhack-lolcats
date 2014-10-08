class Owner < ActiveRecord::Base

  has_many :cats

  # Allow creation of nested models within this
  # (Allow creating cats)
  accepts_nested_attributes_for :cats,
            reject_if: lambda { |cat_attrs| cat_attrs['name'].blank? }
  # It won't save it if the cat has no name
end
