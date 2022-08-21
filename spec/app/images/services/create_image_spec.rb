# frozen_string_literal: true

describe Services::CreateImage do
  describe '#call' do
    subject(:call) { described_class.new(file: file).call }

    let(:filename) { 'test_spec.jpeg' }

    let(:file) do
      {
        filename: filename,
        type: 'image/jpeg',
        tempfile: Tempfile.new("#{APP_ROOT}/public/test_uploads/#{filename}")
      }
    end

    context 'when success create' do
      it 'creates image in db' do
        expect { call }.to change(DB[:images], :count).by(1)
      end

      it 'add file to public/uploads' do
        call
        expect(Dir.glob("#{APP_ROOT}/public/uploads/*_#{filename}").empty?).to eq(false)
      end
    end

    context 'when failed create' do
      let(:filename) { nil }

      it 'creates image in db' do
        expect { call }.not_to change(DB[:images], :count)
      end

      it 'add file to public/uploads' do
        call
        expect(Dir.glob("#{APP_ROOT}/public/uploads/*_#{filename}").empty?).to eq(true)
      end
    end
  end
end
