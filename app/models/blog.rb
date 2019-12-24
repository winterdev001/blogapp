class Blog < ApplicationRecord
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    validates :title, :content,length: {in: 1..140} 
    validates :title, :content, presence: true
    belongs_to :admin

    paginates_per 9
    def self.search(search)
        if search
            where('title LIKE ? or content', "%#{search}%")        
        else
            order('id desc')
        end
    end
end
