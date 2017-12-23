class ApplicationRecord < ActiveRecord::Base
  # part of rails, not ruby, to force correct rails behavior on child classes
  self.abstract_class = true
end