# frozen_string_literal: true

module Endpoints
  class Images < Application
    post '/compress' do
      json status: :ok
    end

    get '/:uuid/download' do
      json uuid: params[:uuid], status: :ok
    end
  end
end
