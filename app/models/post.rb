class Post < ApplicationRecord
  belongs_to :feeling
  belongs_to :user
  belongs_to :genre
end
