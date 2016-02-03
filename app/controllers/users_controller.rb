class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @users = User.order("id")
    #ViewのFormで取得したパラメータをモデルに渡す
    @users = User.search(params[:search])
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザー登録が完了しました。"
      redirect_to :users
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to :users
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :users, notice: "会員を削除しました。"
  end
  
  def home
    @user = current_user
    @coming_event = Event.where('start_time > ?', Time.zone.now).order(:start_time).limit(1).take
    @new_lessons = Lesson.order("created_at DESC").limit(4)
    @admin_user = User.where(admin: true)
    
     relationships = Relationship.group(:favorited_id).order('count_all desc').limit(4).count
     @favorite_lessons = keys_to_lesson!(relationships)
  end
  
  def favoritings
    @user = current_user
    @q = @user.favoriting_lessons.ransack(params[:q])
    @lessons = @q.result.order('created_at DESC').page(params[:page]).per(10)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :school, :classroom, :consultant, :consulting_day, :appear_in, :password, :password_digest, :admin)
  end  
  
  def correct_user
    @user = User.find(params[:id])
   # redirect_to(root_url)unless @user == current_user
  end
  
  def keys_to_lesson!(hash) 
      hash.transform_keys!{ |key| Lesson.find(key) }
  end
end
