class BasisLesson < ActiveRecord::Base
    validates :subject, preserce: true
    validates :number, presence: true
    validates :name, presence: true
    validates :teacher, presence: true
    validates :movie_url, presence: true, uniqueness: true
    validate on: :create do
         if BasisLesson.where(movie_url: movie_url).present?
             errors.add(:basis_lesson,"既に登録されている動画URLです。")
         end
    end
end
