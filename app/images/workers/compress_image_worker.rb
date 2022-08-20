# frozen_string_literal: true

module Workers
  class CompressImageWorker
    include Sidekiq::Worker

    def perform(uid)
      ::Services::CompressImage.new(uid: uid).call
    end
  end
end
