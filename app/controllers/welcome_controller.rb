class WelcomeController < ApplicationController
  def index
  end

  def alive
  	render :json => {:store => {:id => 1, :name => "Safeway", :aisle => {:id => 1, :section => {:number => 1, :items => [{:id => 1, :name => "Chicken"},{:id => 2, :name => "Brocolli"}]}}}}, :status => 200
  end
end
