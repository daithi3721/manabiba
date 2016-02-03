class User < ActiveRecord::Base
    has_many :favoriting_relationships, class_name: "Relationship",
                                       foreign_key: "favoriter_id",
                                       dependent: :destroy
    has_many :favoriting_lessons, through: :favoriting_relationships, source: :favorited
    
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :school, presence: true
    validates :classroom, presence: true
    validates :consultant, presence: true
    validates :consulting_day, presence: true
    validates :appear_in, presence: true, format: URI::regexp(%w(http https))
    validates :password, presence: true, length: { in: 6..20 }, format: { with: /\A[a-z0-9]+\z/i }, on: :create
    has_secure_password
    
    def self.search(search) #self.でクラスメソッドとしている
      if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
        User.where(['name LIKE ?', "%#{search}%"])
      else
        User.all #全て表示。
      end
    end
    
   def favorite(lesson)
     favoriting_relationships.find_or_create_by(favorited_id: lesson.id)
   end
    
   def unfavorite(lesson)
     favoriting_relationship = favoriting_relationships.find_by(favorited_id: lesson.id)
     favoriting_relationship.destroy if favoriting_relationship
   end
    
   def favoriting?(lesson)
     favoriting_lessons.include?(lesson)
   end
end