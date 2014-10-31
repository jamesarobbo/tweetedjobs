class TweetsController < ApplicationController


rescue_from Twitter::Error::TooManyRequests, with: :too_many_requests

	def index

	    if params[:search]

	      @tweets = twitter_client.search("#{params[:search]}+jobs+london").take(20).map {|t| t.id}

	      @tweet_id = Kaminari.paginate_array(@tweets).page(params[:page]).per(10)

	    else

	      @tweets = twitter_client.search("london jobs technology OR tech OR web").take(20).map {|t| t.id}

	      @tweet_id = Kaminari.paginate_array(@tweets).page(params[:page]).per(10)
	      
	    end 


	end

	def too_many_requests

		render "_toomanyrequests"

		
	end





end
