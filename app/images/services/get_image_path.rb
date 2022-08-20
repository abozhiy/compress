# frozen_string_literal: true

module Services
  class GetImagePath
    # @param [String] uid
    def initialize(uid:)
      @uid = uid
    end

    # @return [String<path>, nil]
    def call
      get_path rescue nil
    end

    private

    attr_reader :uid

    def get_path
      "#{UPLOADS_PATH}/#{uid}_#{image[:file_name]}"
    end

    def image
      @image ||= repo.find(uid)
    end

    def repo
      @repo ||= ::Repositories::Image
    end
  end
end
