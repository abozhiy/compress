# frozen_string_literal: true

module Mailers
  class CompressImageMailer
    # @param [String] to
    # @param [String] message
    def initialize(to:, message:)
      @to = to
      @message = message
    end

    def call
      send_mail!
    end

    private

    attr_reader :to, :message

    def send_mail!
      Pony.mail(
        to: to,
        subject: 'State of compress of your image',
        body: message,
        from: 'compress@service.com',
        headers: { 'Content-Type' => 'text/html' },
        charset: 'UTF-8'
      )
    end
  end
end
