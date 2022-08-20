# frozen_string_literal: true

module Endpoints
  class Images < Application
    post '/compress' do
      uid = ::Services::CreateImage.new(file: params[:file]).call
      if uid
        ::Workers::CompressImageWorker.perform_async(uid)
        json uid: uid, status: :ok
      else
        json status: 422
      end
    end

    get '/:uuid/download' do
      path = ::Services::GetImagePath.new(uid: params[:uuid]).call
      if path
        send_file path
      else
        json status: 422
      end
    end
  end
end
