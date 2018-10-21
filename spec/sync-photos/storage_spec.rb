require 'spec_helper'
require 'sync-photos/storage'

RSpec.describe SyncPhotos::Storage do
  let(:storage) { described_class.new(basedir: '/test') }

  describe '#pathname' do
    subject { storage.pathname(path) }

    context 'with fullpath' do
      let(:path) { '/test/hello/world' }
      it { is_expected.to eq '/hello/world' }
    end

    context 'with invalid fullpath' do
      let(:path) { '/unko/hello/world' }
      it { expect { subject }.to raise_error StandardError }
    end

    context 'relative path' do
      let(:path) { './hello/world' }
      it { is_expected.to eq '/hello/world' }
    end
  end
end
