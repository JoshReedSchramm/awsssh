require 'spec_helper'

describe Awsssh::Credentials do
  subject { described_class.new }

  let(:config) do
    {'AccessKeyId' => 'ABC123', 'SecretAccessKey' => 'KEY', 'region' => "us-east-1"}
  end

  let (:credentials) do
    double(Aws::Credentials)
  end
  
  describe '.set_configuration' do
    it 'sets the AWS configuration' do
      allow(File).to receive(:read).and_return(config.to_json)
      allow(Aws::Credentials).to receive(:new).and_return(credentials)
      described_class.set_configuration

      expect(Aws.config[:credentials]).to eq credentials
      expect(Aws.config[:region]).to eq "us-east-1"
    end
  end
end
