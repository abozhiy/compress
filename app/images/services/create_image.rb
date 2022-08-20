# frozen_string_literal: true

module Services
  class CreateImage
    # @param [multipart/form-data] file
    def initialize(file:)
      @file = file
    end

    # @return [String<uid>, nil]
    def call
      run! rescue nil
    end

    private

    attr_reader :file

    def run!
      DB.transaction do
        uid = create
        add_to_uploads(uid: uid)
        uid
      end
    end

    def create
      repo.create(
        filename: file[:filename],
        type: file[:type]
      )
    end

    def add_to_uploads(uid:)
      path = File.join(APP_ROOT, "#{UPLOADS_PATH}/#{uid}_#{file[:filename]}")
      File.open(path, 'wb') do |f|
        f.write(file[:tempfile].read)
      end
    end

    def repo
      @repo ||= ::Repositories::Image
    end
  end
end
