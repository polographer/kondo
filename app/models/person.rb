class Person < ApplicationRecord
    has_many :pictures, through: :appareances
end
