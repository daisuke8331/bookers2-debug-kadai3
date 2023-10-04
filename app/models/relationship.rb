class Relationship < ApplicationRecord
  #1:NのN側
  belongs_to :follower, class_name: "User"
  #Userモデルの中のfollowerがたくさんのrelationshipを持っている
  belongs_to :followed, class_name: "User"
  #上と同じ
end
