class DicesController < ApplicationController

    def home

    end

    def create 
        @dice = Dice.new
        @dice.num_players = params[:num_players]
        redirect_to dice_form_path
    end

    def form

        
    end

    def roll
        @result = (1..6).to_a.shuffle.first
    end

    def result
    end
end