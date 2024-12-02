module Api
  class PeopleController < ApplicationController
    def index
      people = Person.order(id: :asc)
      render_success(t('messages.success'), people)
    end

    def show
      person = Person.find_by_id(params[:id])

      if person.present?
        render_success(t('messages.success'), person)
      else
        render_not_found_error(t('person.name'), params[:id])
      end
    end

    def create
      people_create = PeopleCreator.new(create_person_params: person_inventory_params)

      if people_create.created?
        render_success(t('person.new.valid'))
      else
        render_unprocessable_entity_error(t('person.new.invalid'))
      end
    end

    private

    def person_inventory_params
      params.permit(
        person: %i[name age gender local],
        inventory: %i[water food medication ammunition]
      )
    end
  end
end
