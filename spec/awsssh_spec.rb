require 'spec_helper'
require 'aws-sdk'

describe Awsssh do
  it 'has a version number' do
    expect(Awsssh::VERSION).not_to be nil
  end
end
