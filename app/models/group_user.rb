class GroupUser < ApplicationRecord
    belongs_to :User
    belongs_to :Group
end
