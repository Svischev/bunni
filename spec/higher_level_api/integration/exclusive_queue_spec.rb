require "spec_helper"

describe Bunni::Queue do
  let(:connection) do
    c = Bunni.new(username: "bunni_gem", password: "bunni_password", vhost: "bunni_testbed")
    c.start
    c
  end

  after :each do
    connection.close if connection.open?
  end

  it "is closed when the connection it was declared on is closed" do
    ch1 = connection.create_channel
    ch2 = connection.create_channel
    q   = ch1.queue("", exclusive: true)

    ch1.queue_declare(q.name, passive: true)
    ch2.queue_declare(q.name, passive: true)

    ch1.close
    ch2.queue_declare(q.name, passive: true)

    ch2.queue_delete(q.name)
    ch2.close
  end
end
