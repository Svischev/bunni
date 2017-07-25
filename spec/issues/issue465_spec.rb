# -*- coding: utf-8 -*-
require 'spec_helper'

describe Bunni::Session do
  let(:connection) do
    c = Bunni.new(
        user: 'bunni_gem', password: 'bunni_password',
        vhost: 'bunni_testbed',
        port: ENV.fetch('RABBITMQ_PORT', 5672)
    )
    c.start
    c
  end

  context 'after the connection has been manually closed' do
    before :each do
      connection.close
    end

    after :each do
      connection.close if connection.open?
    end

    describe '#create_channel' do
      it 'should raise an exception' do
        expect {
          connection.create_channel
        }.to raise_error(Bunni::ConnectionAlreadyClosed)
      end
    end
  end
end
