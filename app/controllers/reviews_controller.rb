class ReviewsController < ApplicationController
    
    def index
        get_wine
    end

    def new 
        get_wine
        @review = Review.new
        # @wine = Wine.new
    end

    def create 
       @review = Review.new(review_params)
    
        if @review.save 
            redirect_to wine_reviews_path(@review.wine)
        else
            render :new
        end
    end
 
    private 

    def get_wine
        @wine ||= Wine.find_by(id: params[:wine_id])
    end

    def review_params
        params.require(:review).permit(:review, :wine_id)
    end
end
