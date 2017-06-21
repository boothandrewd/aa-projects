class DogRentalRequestsController < ApplicationController
  def new
    @dog_rental_request = DogRentalRequest.new
    @dogs = Dog.all
    render :new
  end
end
