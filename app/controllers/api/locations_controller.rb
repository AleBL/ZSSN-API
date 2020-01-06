module Api
  class LocationsController < ApplicationController
    def update
      person = Person.find(params[:id])
      local = params.permit(:local)

      if (person.update_attributes(local))
        render json: {status: 'SUCCESS', message: 'Your Location was successfully updated'}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Your Location wasn`t updated', data: person.errors}, status: :unprocessable_entity
      end
    end
  end
end
