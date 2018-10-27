module SyncPhotos
  class CheckRawWorker
    include Sidekiq::Worker
    include SyncPhotos::S3Helper

    def perform(file)
      SyncPhotos::UploadRawWorker.perform_async(file) if old?(file)
      true
    end
  end
end
