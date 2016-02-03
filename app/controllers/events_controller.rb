class EventsController < ApplicationController
    before_action :authenticate
    
    def index
      @events = Event.where('start_time > ?', Time.zone.now).order(:start_time)
    end
    
    def new
      @event = Event.new
    end
    
    def create
      @event = Event.new(event_params)
      if @event.save
          redirect_to @event, notice: 'イベントを作成しました'
      else
          render 'new'
      end
    end
    
    def show
      @event = Event.find(params[:id])
      @admin_user = User.where(admin: true)
    end
    
    def edit
      @event = Event.find(params[:id])
    end
    
    def update
      @event = Event.find(params[:id])
      if @event.update(event_params)
        redirect_to @event, notice: '更新しました。'
      else
        render :edit
      end
    end
    
    def destroy
      @event = Event.find(params[:id])
      @event.destroy!
      redirect_to :events, notice: '削除しました。'
    end
    
    def ustream
      @coming_event = Event.where('start_time > ?', Time.zone.now).order(:start_time).limit(1).take
    end
    
    def finished
      @q = Event.where('start_time < ?', Time.zone.now).ransack(params[:q])
      @finished_events = @q.result.order("start_time desc").page(params[:page]).per(10)
    end
    
    private
    
    def event_params
        params.require(:event).permit(:name, :content, :start_time, :end_time, :event_image, :event_image_cache, :remove_event_image, :teacher, :movie_url)
    end
end