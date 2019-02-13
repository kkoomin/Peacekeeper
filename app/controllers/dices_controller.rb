class DicesController < ApplicationController
    before_action :find_dice, only: [:new, :create, :show, :destroy]

    def index #dice game start page
        @dice = Dice.new
    end

    def create_new
        @dice = Dice.create(dice_params)
        redirect_to enter_name_path(@dice)
    end


    def new #dice game players name input page
        @dice = Dice.find(params[:id])

    end

    def create # roll the dice
        @dice = Dice.find(params[:id])
        if @dice.players.count < @dice.num_of_players
            redirect_to enter_name_path
        end
        @dice.players.each do |p|
            p.result = (1..6).to_a.shuffle.first
            p.save
        end
        redirect_to result_path(@dice)
    end


    def show #dice game result page
        @dice = Dice.find(params[:id])
    end

    def destroy # reset the game
        @dice = Dice.find(params[:id])
        @dice.players.each {|p| p.destroy}
        @dice.destroy
        redirect_to index_path
    end


    private
    
    def find_dice
        @dice = Dice.find(params[:id])
    end

    def dice_params
        params.require(:dice).permit(:title, :num_of_players)
    end
end