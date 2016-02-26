class Report < ActiveRecord::Base
    belongs_to :user
    
     validates :state, presence: true
     validates :date, presence: true
     validates :situation, presence: true
     validates :teacher, presence: true
     validates :subject, presence: true
     validates :user_id, presence: true
     validates :reeport, presence: true
end
