class Lesson < ActiveRecord::Base
    mount_uploader :lesson_image, LessonImageUploader
    has_many :favoriter_relationships, class_name: "Relationship",
                                       foreign_key: "favorited_id",
                                       dependent: :destroy
    has_many :favoriter_users, through: :favoriter_relationships, source: :favoriter
    validates :name, length: { maximum: 50 }, presence: true
    validates :description, length: { maximum: 200 }, presence: true
    validates :teacher, length: { maximum: 20 }, presence: true
    ## validates :movie_url, format: URI::regexp(%w(http https)), presence: true
    #"validates :release_day, presence: true
    
    def self.search(search) #self.でクラスメソッドとしている
      if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
        Lesson.where(['name LIKE ?', "%#{search}%"])
      else
        Lesson.all #全て表示。
      end
    end
end
