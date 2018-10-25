require 'aws-sdk-s3'
require 'shared-mime-info'

module SyncPhotos
  class Storage
    attr_reader :basedir

    def initialize(bucket: nil, basedir: nil, prefix: '')
      @bucket = bucket
      @basedir = Pathname.new(basedir)
      @prefix = prefix.gsub(/\A\//, '')
    end

    def client
      @client ||= Aws::S3::Client.new
    end

    def upload(path)
      target = File.join(@prefix, pathname(path))
      client.put_object(body: File.open(path), bucket: @bucket, key: target, content_type: MIME.check(path).to_s)
    end

    def pathname(path)
      fullpath = File.expand_path(path, basedir.to_s)
      raise unless fullpath.start_with?(basedir.to_s)

      fullpath.gsub(%r{\A#{basedir}/}, '')
    end
  end
end
