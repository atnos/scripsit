module Scripsit
  class Content < ApplicationRecord
    belongs_to :scripsit_slug, class_name: "Scripsit::Slug"
    validates :subject, presence: true
    validates :body, presence: true
  end
end
