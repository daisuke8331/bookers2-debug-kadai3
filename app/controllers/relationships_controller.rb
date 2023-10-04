class RelationshipsController < ApplicationController

  def create #フォローする
    user = User.find(params[:user_id]) #フォロー対象のユーザーを特定
    current_user.follow(user) #フォローする
    redirect_to request.referer #同じページにリダイレクト
  end

  def destroy #フォロー外す
    user = User.find(params[:user_id])
    current_user.unfollow(user) #フォロー外す
    redirect_to request.referer
  end
    #follow,unfollowのアクションはuserモデルに記述してある

  def followings #特定のユーザーが誰をフォローしているのか表示する
    user = User.find(params[:user_id]) #対象のユーザーを特定
    @users = user.following_user #フォローしているユーザー(user.followings)を@usersに代入
  end

  def followers #特定のユーザーが誰からフォローされているのか表示する
    user = User.find(params[:user_id])
    @users = user.follower_user #フォローされているユーザー(user.followers)を@usersに代入
  end

end
