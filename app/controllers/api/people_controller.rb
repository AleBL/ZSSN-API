module Api
  class PeopleController < ApplicationController
    def index
      people = Person.order('id desc')
      render json: {status: I18n.t('status.success'), data: people}, status: :ok
    end

    def show
      person = Person.find(params[:id])
      render json: {status: I18n.t('status.success'), message: I18n.t('messages.success'), data: person}, status: :ok
    end

    def create
      people_create = PeopleCreator.new(create_person_params: person_inventory_params)
      
      if people_create.created?
        render json: {status: I18n.t('status.success'), message: I18n.t('person.new.valid')}, status: :ok
      else
        render json: {status: I18n.t('status.error'), message: I18n.t('person.new.invalid')}, status: :unprocessable_entity
      end
    end

    private
    def person_inventory_params
      params.permit(person: [:name, :age, :gender, :local],
        inventory: [:water, :food, :medication, :ammunition])
    end
  end
end
