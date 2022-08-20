# frozen_string_literal: true

module Repositories
  class Image
    class << self
      def find(uid)
        dataset
          .where(uid: uid)
          .first
      end

      def create(filename:, type:)
        dataset.insert(
          file_name: filename,
          content_type: type
        )
      end

      def update(**opts)
        dataset
          .where(uid: opts[:uid])
          .update(opts.except(:uid))
      end

      def delete(uid)
        dataset
          .where(uid: uid)
          .delete
      end

      private

      def dataset
        DB[:images]
      end
    end
  end
end
