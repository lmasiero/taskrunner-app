class BlockTime < ApplicationRecord
  has_and_belongs_to_many :professionals, dependent: :destroy
end
