require 'aws-sdk-s3'
require 'shared-mime-info'

module SyncPhotos
  module S3Helper
    def client
      @client ||= Aws::S3::Client.new
    end

    def old?(path)
      key = keyname(path)
      meta = client.head_object(bucket: ENV['BUCKET'], key: key)
      File.mtime(path) > meta['last_modified']
    rescue Aws::S3::Errors::NotFound
      true
    end

    def upload(path)
      key = keyname(path)
      client.put_object(body: File.open(path), bucket: ENV['BUCKET'],
                        key: key, content_type: MIME.check(path).to_s)
    end

    def keyname(path)
      fullpath = File.expand_path(path, ENV['DIR'])
      raise unless fullpath.start_with?(ENV['DIR'])

      fullpath.gsub(%r{#{ENV['DIR']}/}, '')
    end
  end
end
