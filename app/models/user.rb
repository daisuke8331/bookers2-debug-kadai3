class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  has_many :favorites, dependent: :destroy

  has_many :book_comments, dependent: :destroy

  #1:Nの1側 Relationshipモデルに対する
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  #Relationshipモデル内のたくさんのfollowerを持っている/follower_idを外部キーとして引っ張ってくる
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  #Relationshipモデル内のたくさんのfollowedを持っている/followed_idを外部キーとして引っ張ってくる
  has_many :following_user, through: :follower, source: :followed
  #following_userという架空のテーブルを作成することで、Relationshipモデル(中間テーブル)
  #を経由してfollowedテーブルからデータを取得できる
  has_many :follower_user, through: :followed, source: :follower
  #follower_userという架空のテーブルを作成することで、Relationshipモデル(中間テーブル)
  #を経由してfollowerテーブルからデータを取得できる

  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length:{maximum: 50} #バリデーション追加



  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
