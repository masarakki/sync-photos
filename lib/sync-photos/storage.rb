require 'aws-sdk-glacier'

module SyncPhotos
  class Storage
    attr_reader :basedir

    def initialize(bucket: nil, basedir: nil)
      @bucket = bucket
      @basedir = Pathname.new(basedir)
    end

    def client
      @client ||= Aws::Glacier::Client.new
    end

    def vault
      @vault ||= client.describe_vault(vault_name: @bucket)
    rescue Aws::Glacier::Errors::ResourceNotFoundException
      client.create_vault(vault_name: @bucket)
      vault
    end

    def upload(path); end

    def pathname(path)
      fullpath = File.expand_path(path, basedir.to_s)
      raise unless fullpath.start_with?(basedir.to_s)

      fullpath.gsub(/\A#{basedir}/, '')
    end
  end
end
