class TweetsController < ApplicationController
  before_action :set_tweet, only: [:destroy, :edit, :update, :show]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @tweets = Tweet.includes(:user).order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.valid?
      @tweet.save
    else
      render :new
    end
  end

  def destroy
    unless @tweet.destroy
      render :index
    end
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
    params.require(:tweet).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
