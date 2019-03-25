class Subject < ApplicationRecord
    validates_uniqueness_of :description
    has_many :questions
    paginates_per 10
end
