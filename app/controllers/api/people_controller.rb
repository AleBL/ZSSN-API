module Api
  class PeopleController < ApplicationController
    def index
      people = Person.order(id: :asc)
      render json: { status: t('status.success'), data: people }, status: :ok
    end

    def show
      person = Person.find_by_id(params[:id])

      if person
        render json: { status: t('status.success'), message: t('messages.success'), data: person }, status: :ok
      else
        render json: { 
          status:  t('status.error'), 
          message: t('messages.not_found', class: t('person.name'), id: params[:id]) 
        }, status: :not_found
      end
    end

    def create
      people_create = PeopleCreator.new(create_person_params: person_inventory_params)
      
      if people_create.created?
        render json: { status: t('status.success'), message: t('person.new.valid') }, status: :ok
      else
        render json: { status: t('status.error'), message: t('person.new.invalid') }, status: :unprocessable_entity
      end
    end

    private
    def person_inventory_params
      params.permit(
        person:    [:name, :age, :gender, :local],
        inventory: [:water, :food, :medication, :ammunition]
      )
    end
  end
end
