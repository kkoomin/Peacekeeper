class PlayersController < ApplicationController

    def new # render the name input form 
        @player = Player.new
    end

    def create # create a player
        @player = Player.create(player_params)
        redirect_to enter_name_path(@player.dice_id)
    end

    private 

    def player_params
        params.require(:player).permit(:name, :dice_id)
    end
end