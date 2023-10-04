class BookComment < ApplicationRecord

  belongs_to :user
  belongs_to :book

  validates :comment, presence: true #空欄のままコメントを投稿できない設定

end
