class BasisLessonsController < ApplicationController
   before_action :authenticate
     
    def new
     @basis_lesson = BasisLesson.new
    end
    
    def create
       @basis_lesson = BasisLesson.new(basis_lesson_params)
      if @basis_lesson.save
          redirect_to :basis_lessons, notice: '基礎授業を作成しました'
      else
          render 'new'
      end
    end
    
    def index
       @basis_lessons = BasisLesson.order(subject: :asc, number: :asc, name: :asc)
      # @basis_lessons = BasisLesson.search(params[:search])
    end
    
    def edit
        @basis_lesson = BasisLesson.find(params[:id])
    end
    
    def update
       @basis_lesson = BasisLesson.find(params[:id])
        if @basis_lesson.update_attributes(basis_lesson_params)
          flash[:success] = "基礎授業を更新しました。"
          redirect_to :basis_lessons
        else
          render 'edit'
        end
    end
    
    def show
       @basis_lesson = BasisLesson.find(params[:id])
    end
    
    def destroy
      @basis_lesson = BasisLesson.find(params[:id])
      @basis_lesson.destroy
      redirect_to :basis_lessons, notice: "会員を削除しました。"
    end
    
    def thumbnails
    end
    
    def grammer
      @basis_lessons = BasisLesson.where(subject: '７日間 英文法 基礎完成講座').order(number: :asc, name: :asc)
    end
    
    def reading
      @basis_lessons = BasisLesson.where(subject: '７日間 英文読解 基礎完成講座').order(number: :asc, name: :asc)
    end
    
    def japanese
      @basis_lessons = BasisLesson.where(subject: '基礎現代文').order(number: :asc, name: :asc)
    end
    
    def kobun
      @basis_lessons = BasisLesson.where(subject: 'たった6時間で古典文法をマスターする方法').order(number: :asc, name: :asc)
    end
    
    def mathematics_1a
      @basis_lessons = BasisLesson.where(subject: '基礎数学1A').order(number: :asc, name: :asc)
    end
    
    def mathematics_2b
      @basis_lessons = BasisLesson.where(subject: '基礎数学2B').order(number: :asc, name: :asc)
    end
    
    def mathematics_3
      @basis_lessons = BasisLesson.where(subject: '基礎数学3').order(number: :asc, name: :asc)
    end
    
    def physis
      @basis_lessons = BasisLesson.where(subject: '基礎物理').order(number: :asc, name: :asc)
    end
    
    def chemistry
      @basis_lessons = BasisLesson.where(subject: '基礎化学').order(number: :asc, name: :asc)
    end
    
    private
    
    def basis_lesson_params
      params.require(:basis_lesson).permit(:subject, :number, :name, :teacher, :thumbnail_cache, :remove_thumbnail, :thumbnail, :movie_url, :school)
    end
end
