class Reservation < ActiveRecord::Base
  mount_uploader :question_image, QuestionImageUploader
  
  belongs_to :user
  validates :reception_date, presence: true
  validates :recept, presence: true
  validates :question_type, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
  validate on: :create do
    if Reservation.where(user_id: user_id, reception_date: reception_date).count > 2
      errors.add(:reservation,"WEB質問予約は１日2件までとなります")
    end
  end
  validate on: :create do
    if reception_date.wday == 0
      errors.add(:reservation, "日曜日に予約をする事は出来ません。")
    end
  end
end
