class Dice

    attr_accessor :num_players, :players, :results

    def initialize(num_players = nil, players = [], results=[])
        @num_players = num_players
        @players = players
        @results = results
    end

    
end