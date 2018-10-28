module SyncPhotos
  class UploadRawWorker
    include Sidekiq::Worker
    include SyncPhotos::S3Helper

    sidekiq_options queue: 'upload'

    def perform(file)
      upload(file)
    end
  end
end
