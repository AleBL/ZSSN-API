module Api
  class LocationsController < ApplicationController
    def update
      person = Person.find_by_id(params[:id])
      local = params.permit(:local)

      if (person.update_attributes(local))
        render json: { status: t('status.success'), message: t('person.update_location.valid') }, status: :ok
      else
        render json: {
          status: t('status.error'), 
          message: t('person.update_location.invalid'), 
          data: person.errors
        }, status: :unprocessable_entity
      end
    end
  end
end
