class Favorite < ApplicationRecord
  
  #userモデル,bookモデルに対して1:NのN側
  belongs_to :user
  belongs_to :book
  
end
