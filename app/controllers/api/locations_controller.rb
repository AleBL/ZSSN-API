module Api
  class LocationsController < ApplicationController
    def update
      person = Person.find(params[:id])
      local = params.permit(:local)

      if (person.update_attributes(local))
        render json: {status: I18n.t('status.success'), message: I18n.t('person.update_location.valid')}, status: :ok
      else
        render json: {status: I18n.t('status.error'), message: I18n.t('person.update_location.invalid'), data: person.errors}, status: :unprocessable_entity
      end
    end
  end
end
