module Api
  class LocationsController < ApplicationController
    def update
      person = Person.find_by(id: params[:id])
      local = params.permit(:local)

      return render_not_found_error(t('person.name'), params[:id]) if person.blank?

      if person.update(local)
        render_success(t('person.update_location.valid'))
      else
        render_unprocessable_entity_error(t('person.update_location.invalid'), person.errors)
      end
    end
  end
end
