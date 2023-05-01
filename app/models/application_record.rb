# frozen_string_literal: true

# Application record goes here to handle the case where the string is already there

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
