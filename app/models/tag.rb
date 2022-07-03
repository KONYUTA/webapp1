class Tag < ApplicationRecord
    has_many :menu_tags,dependent: :destroy, foreign_key: 'tag_id'
    has_many :menus,through: :menu_tags

    validates :name, uniqueness: true, presence: true
end
