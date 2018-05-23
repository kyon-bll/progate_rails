# coding: utf-8

require "date"

class RubyController < ApplicationController
  class Character
    attr_accessor :name
    attr_accessor :price

    def initialize(name, price)
      self.name = name
      self.price = price
    end
    
  end

  def index
    pizza = Character.new('pizza', 400)
      
    @result = Date.today.wednesday?
  end
end
