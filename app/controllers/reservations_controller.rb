class ReservationsController < ApplicationController
    before_action :logged_in_user
    
    def index
      @search = Reservation.search(params[:q])
      @reservations = @search.result.order("reception_date desc, recept asc").page(params[:page]).per(20)
    end
    
    def new
      if current_user.admin?
        @reservation = Reservation.new
      else
        @reservation = Reservation.new(subject: params[:subject], recept: params[:recept], reception_date: params[:reception_date])
      end
    end
    
    def create
       @reservation = Reservation.new(reservation_params)
      if @reservation.save
          redirect_to @reservation
      else
          render 'new'
      end
    end
    
    def show
      @reservation = Reservation.find(params[:id])
    end
    
    def edit
      @reservation = Reservation.find(params[:id])
    end
    
    def update
      @reservation = Reservation.find(params[:id])
      if @reservation.update(reservation_params)
        redirect_to @reservation
      else
        render :edit
      end
    end
    
    def english_reserved_list
      reception_days = Date.today..Date.today + 4
      reserved_lists = Reservation.where(reception_date: Date.today..Date.today + 4, subject: "英語")
      recept_flame = ["19時00分", "19時15分", "19時30分", "19時45分", "20時00分", "20時15分", "20時30分", "20時45分", "21時00分", "21時15分", "21時30分", "21時45分", "22時00分", "22時15分", "22時30分", "22時45分"]
      @reservations = []
      reception_days.each do |date|
        reservations_per_day = []
        recept_flame.each do |recept|
          reservation = reserved_lists.find_or_initialize_by(reception_date: Date.new(date.year, date.month, date.day), recept: recept)
           reservations_per_day << reservation
        end
        @reservations << { date: date, reservations_per_day: reservations_per_day }
      end
    end
    
    def mathematics_reserved_list
      reception_days = Date.today..Date.today + 4
      reserved_lists = Reservation.where(reception_date: Date.today..Date.today + 4, subject: "数学")
      recept_flame = ["19時00分", "19時15分", "19時30分", "19時45分", "20時00分", "20時15分", "20時30分", "20時45分", "21時00分", "21時15分", "21時30分", "21時45分", "22時00分", "22時15分", "22時30分", "22時45分"]
      @reservations = []
      reception_days.each do |date|
        reservations_per_day = []
        recept_flame.each do |recept|
          reservation = reserved_lists.find_or_initialize_by(reception_date: Date.new(date.year, date.month, date.day), recept: recept)
           reservations_per_day << reservation
        end
        @reservations << { date: date, reservations_per_day: reservations_per_day }
      end
    end
    
    def japanese_reserved_list
      reception_days = Date.today..Date.today + 4
      reserved_lists = Reservation.where(reception_date: Date.today..Date.today + 4, subject: "現代文")
      recept_flame = ["19時00分", "19時15分", "19時30分", "19時45分", "20時00分", "20時15分", "20時30分", "20時45分", "21時00分", "21時15分", "21時30分", "21時45分", "22時00分", "22時15分", "22時30分", "22時45分"]
      @reservations = []
      reception_days.each do |date|
        reservations_per_day = []
        recept_flame.each do |recept|
          reservation = reserved_lists.find_or_initialize_by(reception_date: Date.new(date.year, date.month, date.day), recept: recept)
           reservations_per_day << reservation
        end
        @reservations << { date: date, reservations_per_day: reservations_per_day }
      end
    end
    
    def kobun_reserved_list
      reception_days = Date.today..Date.today + 4
      reserved_lists = Reservation.where(reception_date: Date.today..Date.today + 4, subject: "古文")
      recept_flame = ["19時00分", "19時15分", "19時30分", "19時45分", "20時00分", "20時15分", "20時30分", "20時45分", "21時00分", "21時15分", "21時30分", "21時45分", "22時00分", "22時15分", "22時30分", "22時45分"]
      @reservations = []
      reception_days.each do |date|
        reservations_per_day = []
        recept_flame.each do |recept|
          reservation = reserved_lists.find_or_initialize_by(reception_date: Date.new(date.year, date.month, date.day), recept: recept)
           reservations_per_day << reservation
        end
        @reservations << { date: date, reservations_per_day: reservations_per_day }
      end
    end
    
    def destroy
      @reservation = Reservation.find(params[:id])
      @reservation.destroy!
      redirect_to :reservations
    end
    
    def subject_select
    end
    
    private
    
    def reservation_params
      params.require(:reservation).permit(:user_id, :content, :subject, :reception_date, :recept, :question_type, :question_image, :question_image_cache, :remove_question_image, :situation, :question_staff, :question_report)
    end
end