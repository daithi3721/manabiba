class LessonsController < ApplicationController
    before_action :authenticate
  
    def index
      @q = Lesson.ransack(params[:q])
      @lessons = @q.result.order('created_at DESC').page(params[:page]).per(10)
    end
    
    def favorite_ranks
     @q = Lesson.ransack(params[:q])
     @lessons = @q.result.order('created_at DESC').page(params[:page]).per(10)
     relationships = Relationship.group(:favorited_id).order('count_all desc').count
     @favorite_lessons = keys_to_lesson!(relationships)
    end

    def new
      @lesson = Lesson.new
    end
    
    def create
      @lesson = Lesson.new(lesson_params)
      if @lesson.save
          redirect_to @lesson, notice: '作成しました'
      else
          render 'new'
      end
    end
    
    def show
      @lesson = Lesson.find(params[:id])
    end
    
    def edit
      @lesson = Lesson.find(params[:id])
    end
    
    def update
      @lesson = Lesson.find(params[:id])
      if @lesson.update(lesson_params)
        redirect_to @lesson, notice: '更新しました。'
      else
        render :edit
      end
    end
    
    def destroy
      @lesson = Lesson.find(params[:id])
      @lesson.destroy!
      redirect_to :lessons, notice: '削除しました。'
    end
    
    private
    
    def lesson_params
        params.require(:lesson).permit(:name, :description, :teacher, :movie_url, :lesson_image, :lesson_image_cache, :remove_lesson_image)
    end
    
    def keys_to_lesson!(hash) 
      hash.transform_keys!{ |key| Lesson.find(key) }
    end
end
