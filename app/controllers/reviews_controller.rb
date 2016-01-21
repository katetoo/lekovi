class ReviewsController < ApplicationController 
    def index
        @rgen = Reviewgeneric.all
        @rmed = Reviewmed.all
    end
end