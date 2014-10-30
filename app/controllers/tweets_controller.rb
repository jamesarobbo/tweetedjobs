class TweetsController < ApplicationController

	def index

    if params[:search]

      @tweets = twitter_client.search("#{params[:search]}+jobs").take(12).map {|t| t.id}

      @tweet_id = Kaminari.paginate_array(@tweets).page(params[:page]).per(6)

    else

      @tweets = twitter_client.search("technology job web").take(12).map {|t| t.id}

      @tweet_id = Kaminari.paginate_array(@tweets).page(params[:page]).per(6)

  
    end  

    

	end

end
