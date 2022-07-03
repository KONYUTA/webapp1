class Menu < ApplicationRecord
    belongs_to :user
    belongs_to :genre
    has_many :items
    has_many :procedures
    has_many :menu_tags, dependent: :destroy
    has_many :tags, through: :menu_tags
    has_one_attached :menu_image
    
    def get_menu_image(size)
        unless menu_image.attached?
            file_path = Rails.root.join('app/assets/images/no_image.jpg')
            menu_image.attach(io: File.open(file_path),filename: 'no-image.jpg', content_type: 'image/jpeg')
        end
        menu_image.variant(resize: size).processed
     end
     
     def save_tag(sent_tags)
        current_tags = self.tags.pluck(:name)
        old_tags = current_tags - sent_tags
        new_tags = sent_tags - current_tags
        
        old_tags.each do |old|
            self.tags.delete　Tag.find_by(name: old)
        end
        
        new_tags.each do |new|
            new_menu_tag = Tag.find_or_create_by(name: new)
            self.tags << new_menu_tag
        end
    end
end
