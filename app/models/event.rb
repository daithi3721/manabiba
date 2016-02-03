class Event < ActiveRecord::Base
    mount_uploader :event_image, EventImageUploader
    
    validates :name, length: { maximum: 50 }, presence: true
    validates :content, length: { maximum: 1000 }, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    validate :start_time_should_be_before_end_time
    validates :movie_url, presence: true
    
    private
    
    def start_time_should_be_before_end_time
        return unless start_time && end_time
        
        if start_time >= end_time
            erorrs.add(:start_time, 'は終了時間よりも前に設定して下さい。')
        end
    end
end
