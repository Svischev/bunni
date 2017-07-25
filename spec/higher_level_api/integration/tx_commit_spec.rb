require "spec_helper"

describe Bunni::Channel, "#tx_commit" do
  let(:connection) do
    c = Bunni.new(username: "bunni_gem", password: "bunni_password", vhost: "bunni_testbed")
    c.start
    c
  end

  after :each do
    connection.close if connection.open?
  end

  it "is supported" do
    ch = connection.create_channel
    ch.tx_select
    ch.tx_commit

    ch.close
  end
end
