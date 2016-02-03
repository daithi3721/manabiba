module FavoritesHelper
  def favorite_icon(lesson, user)
    if user
      if user.favorites.exists?(lesson: lesson)
        '<i class="glyphicon glyphicon-heart-empty"></i>'
      else
        '<i class="glyphicon glyphicon-heart"></i>'
      end
    end
  end
end