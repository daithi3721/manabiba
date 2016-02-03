class RelationshipsController < ApplicationController
    before_action :logged_in_user

    def create
      @lesson = Lesson.find(params[:favorited_id])
      current_user.favorite(@lesson)
    end

    def destroy
        @lesson = current_user.favoriting_relationships.find(params[:id]).favorited
        current_user.unfavorite(@lesson)
    end
end
