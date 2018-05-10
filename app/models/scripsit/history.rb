module Scripsit
  class History < ApplicationRecord
    belongs_to :scripsit_slug
  end
end
