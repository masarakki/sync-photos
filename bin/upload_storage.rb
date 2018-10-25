#!/usr/bin/env ruby
require_relative '../lib/sync-photos/storage'

basedir = ENV['BASEDIR']
storage = SyncPhotos::Storage.new(bucket: ENV['BUCKET_NAME'], basedir: basedir, prefix: ENV['PREFIX'])

Dir.glob("#{basedir}/**/*.CR2") do |filename|
  storage.upload(filename)
end
