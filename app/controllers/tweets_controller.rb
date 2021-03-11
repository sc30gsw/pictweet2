class TweetsController < ApplicationController
  before_action :set_tweet, only: [:destroy, :edit, :update, :show]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
  end

  def destroy
    @tweet.destroy
  end

  def edit
  end

  def update
    @tweet.update(tweet_params)
  end

  def show
  end

  private

  def tweet_params
    params.require(:tweet).permit(:name, :image, :text).merge(user_id: curretn_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
