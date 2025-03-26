module Producers
  class Base
    def initialize
      @producer = Kafka::Producer.new({
        "bootstrap.servers" => ENV["KAFKA_URL"],
        "broker.address.family" => "v4"
      })
    end

    def call
      @producer.produce(topic: topic, payload: payload.to_json.to_slice)
    end

    private def topic
      raise "Set up topic"
    end
    
    private def payload
      raise "Set up payload"
    end
  end
end
