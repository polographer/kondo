class Album < ApplicationRecord
    has_many :pictures, through: :pages
end
