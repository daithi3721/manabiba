class Report < ActiveRecord::Base
    belongs_to :user
    
     validates :state, presence: true
     validates :date, presence: true
     validates :situation, presence: true
     validates :teacher, presence: true
     validates :subject, presence: true
     validates :reeport, presence: true
     validate on: :create do
         if User.where(id: user_id).blank?
             errors.add(:report,"ユーザー情報がありません。IDを確認してください。")
         end
     end
end
