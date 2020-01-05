module Api
  class PeopleController < ApplicationController
    def index
      people = Person.order('id desc')
      render json: {status: 'SUCCESS', data: people}, status: :ok
    end

    def show
      person = Person.find(params[:id])
      render json: {status: 'SUCCESS', message: 'Succcessfully Loaded', data: person}, status: :ok
    end

    def create
      person = Person.new(person_inventory_params[:person])
      person.infected = false

      inventory = Inventory.new(person_inventory_params[:inventory])
      if inventory.save
        person.inventory_id = inventory.id
        if person.save
          render json: {status: 'SUCCESS', message: 'Person Succcessfully Saved'}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Person wasn`t Saved', data: person.errors},
          status: :unprocessable_entity
        end
      else
        render json: {status: 'ERROR', message: 'Inventory wasn`t Saved', data: inventory.errors},
        status: :unprocessable_entity
      end
    end

    private
    def person_inventory_params
      params.permit(person: [:name, :age, :gender, :local],
        inventory: [:water, :food, :medication, :ammunition])
    end
  end
end
