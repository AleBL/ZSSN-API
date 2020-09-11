module Api
  class LocationsController < ApplicationController
    def update
      person = Person.find_by_id(params[:id])
      local = params.permit(:local)

      unless person
        return render json: { 
          status:  t('status.error'), 
          message: t('messages.not_found', { class: t('person.name'), id: params[:id] }) 
        }, status: :not_found
      end

      if (person.update(local))
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
