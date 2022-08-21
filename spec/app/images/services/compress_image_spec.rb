# frozen_string_literal: true

describe Services::CompressImage do
  describe '#call' do
    subject(:call) { described_class.new(uid: uid).call }

    let(:uid) { 'beb6462f-191d-43a6-abf6-a51bf724fc34' }
    let(:success_msg) do
      "Your image has been compressed, download it by \n
      <a href='http://localhost:9292/images/#{uid}/download'>link</a>"
    end
    let(:failed_msg) { "Your image hasn't been compressed, try again." }
    let(:fake_mailer) { instance_double(Mailers::CompressImageMailer) }

    context 'when failed compress' do
      before do
        allow_any_instance_of(described_class).to receive(:compress_image?).and_return false
        allow(Mailers::CompressImageMailer).to receive(:new).with(to: 'test@test.com', message: failed_msg).and_return fake_mailer
        allow(fake_mailer).to receive(:call)
      end

      it do
        call
        expect(Mailers::CompressImageMailer).to have_received(:new).with(to: 'test@test.com', message: failed_msg)
      end
    end

    context 'when success compress' do
      before do
        allow_any_instance_of(described_class).to receive(:compress_image?).and_return true
        allow(Mailers::CompressImageMailer).to receive(:new).with(to: 'test@test.com', message: success_msg).and_return fake_mailer
        allow(fake_mailer).to receive(:call)
      end

      it do
        call
        expect(Mailers::CompressImageMailer).to have_received(:new).with(to: 'test@test.com', message: success_msg)
      end
    end
  end
end
