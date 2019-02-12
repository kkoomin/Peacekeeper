class DicesController < ApplicationController

    def home

    end

    def new

    end

    def roll
        @result = (1..6).to_a.shuffle.first
    end


end