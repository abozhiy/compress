# frozen_string_literal: true

module Services
  class CompressImage
    # @param [String] uid
    def initialize(uid:)
      @uid = uid
    end

    def call
      message = failed
      message = success if compress_image?

      send_mail(message: message)
    end

    private

    attr_reader :uid

    def compress_image?
      size_before = File.size(path)
      optimize
      size_after = File.size(path)

      if size_after < size_before
        add_compressed_at
        return true
      end
      false
    rescue
      false
    end

    def path
      File.join(APP_ROOT, "#{UPLOADS_PATH}/#{uid}_#{image[:file_name]}")
    end

    def add_compressed_at
      repo.update(
        uid: uid,
        compressed_at: DateTime.now
      )
    end

    def send_mail(message:)
      ::Mailers::CompressImageMailer
        .new(
          to: 'test@test.com',
          message: message
        )
        .call
    end

    def optimize
      ImageOptimizer.new(path, quality: 25).optimize
    end

    def success
      "Your image has been compressed, download it by \n
      <a href='http://localhost:9292/images/#{uid}/download'>link</a>"
    end

    def failed
      "Your image hasn't been compressed, try again."
    end

    def image
      @image ||= repo.find(uid)
    end

    def repo
      @repo ||= ::Repositories::Image
    end
  end
end
