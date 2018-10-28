require 'sidekiq'
require_relative './sync-photos/s3_helper'
require_relative './sync-photos/check_raw_worker'
require_relative './sync-photos/upload_raw_worker'
