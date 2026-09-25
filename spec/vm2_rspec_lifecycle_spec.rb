require_relative "../lib/vm2_state"

RSpec.describe "VM2 RSpec lifecycle guard" do
  after(:each) do
    raise "VM2 independent after-hook cleanup invariant failure" if VM2State.dirty?
  end

  it "keeps the quarantined test body healthy" do
    puts "VM2_RSPEC_ID=#{RSpec.current_example.id}"
    expect(VM2State.perform).to eq(true)
  end
end
