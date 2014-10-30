class TweetsController < ApplicationController

	def index

    if params[:search]

      @tweets = twitter_client.search("#{params[:search]}+jobs").take(60).map {|t| t.id}

      @tweet_id = Kaminari.paginate_array(@tweets).page(params[:page]).per(20)

    else

      @tweets = twitter_client.search("technology job web").take(60).map {|t| t.id}

      @tweet_id = Kaminari.paginate_array(@tweets).page(params[:page]).per(20)

  
    end  

    

	end

end
