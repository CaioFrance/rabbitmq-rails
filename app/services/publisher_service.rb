class PublisherService
  attr_accessor :connection, :channel

  def initialize
    @connection = RabbitmqService.new
    @connection.start
    @channel = @connection.create_channel
  end

  def exchange(name, type = :fanout)
    @exchange = Bunny::Exchange.new(@channel, type, name)
  end

  def queue(routing_key, name = "default", durable = false)
    @channel.queue(name, durable: durable)
      .bind(@exchange, routing_key: routing_key)
  end

  def publish_message(routing_key, msg, persistent = false)
    @exchange.publish(msg, routing_key: routing_key,
      persistent: persistent)
  end

  def close_connection
    @connection.close
  end
end