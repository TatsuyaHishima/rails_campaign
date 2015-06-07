class Prize < ActiveRecord::Base
    belongs_to :user
    serialize :result
end
