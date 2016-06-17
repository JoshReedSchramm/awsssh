require 'spec_helper'

describe Awsssh::Commands::List do
  subject { described_class.new }

  let(:client) { double(Aws::EC2::Client) }

  it 'returns a list of servers' do
    allow(Aws::EC2::Client).to receive(:new).and_return(client)
    expect(client).to receive(:describe_instances).
      and_return(["i-abcdef", "i-12345"])

    expect(subject.execute).to eq ["i-abcdef", "i-12345"]
  end
end
