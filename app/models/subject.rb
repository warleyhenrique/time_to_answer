class Subject < ApplicationRecord
    validates_uniqueness_of :description
    paginates_per 10
end
