module SyncPhotos
  class UploadRawWorker
    include Sidekiq::Worker
    include SyncPhotos::S3Helper

    def perform(file)
      upload(file)
    end
  end
end
