require 'smoke_test'

describe 'smoke_test' do
  it '#true? returns true' do
    smoke_test = SmokeTest.new
    expect(smoke_test.true?).to eq true
  end
end
