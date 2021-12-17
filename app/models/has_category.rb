# frozen_string_literal: true

class HasCategory < ApplicationRecord
  belongs_to :article
  belongs_to :category
end
