class Blog < ApplicationRecord
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    belongs_to :admin

    paginates_per 10
    def self.search(search)
        if search
            where('title LIKE ? or content', "%#{search}%")        
        else
            order('id desc')
        end
    end
end
