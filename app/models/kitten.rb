class Kitten < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 100 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :cuteness, presence: true, numericality: { only_integer: true, in: 1..10 }
  validates :softness, presence: true, numericality: { only_integer: true, in: 1..10 }
end
