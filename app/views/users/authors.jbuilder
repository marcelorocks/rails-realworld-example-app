# frozen_string_literal: true

json.authors do |json|
  json.array! @users, partial: 'users/user', as: :user
end

json.articles_count @users_count
