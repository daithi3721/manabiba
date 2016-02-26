class ReportsController < ApplicationController
    before_action :logged_in_user
    
    def index
        @search = Report.search(params[:q])
        @reports = @search.result.order("date desc").page(params[:page]).per(20)
    end
    
    def new
        @report = Report.new
    end
    
    def create
         @report = Report.new(report_params)
      if @report.save
          redirect_to :reports
      else
          render 'new'
      end
    end
    
    def show
        @report = Report.find(params[:id])
    end
    
    def edit
        @report = Report.find(params[:id])
    end
    
    def update
        @report = Report.find(params[:id])
      if @report.update(report_params)
        redirect_to @report
      else
        render :edit
      end
    end
    
    def destroy
        @report = Report.find(params[:id])
        @report.destroy!
        redirect_to :reports
    end
    
    private
    
    def report_params
         params.require(:report).permit(:state, :date, :situation, :teacher, :subject, :user_id, :reeport, :answer_report)
    end
end
