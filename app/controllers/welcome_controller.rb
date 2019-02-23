class WelcomeController < ApplicationController
  def index
    @test = Twitter::ExtractDmsService.new.call
  end
end