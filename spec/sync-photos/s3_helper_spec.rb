require 'spec_helper'

RSpec.describe SyncPhotos::S3Helper do
  include SyncPhotos::S3Helper

  describe '#keyname' do
    subject { keyname(path) }

    context 'with valid' do
      let(:path) { '/test/unko/hoge.png' }
      it { is_expected.to eq 'unko/hoge.png' }
    end
  end
end
