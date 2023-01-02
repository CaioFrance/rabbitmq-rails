class RabbitmqService
  attr_accessor :connection, :channel

  def initialize(hostname = "localhost")
    @connection = Bunny.new(hostname: hostname)
  end

  def start
    @connection.start
  end

  def close
    @connection.close
  end

  def create_channel
    @connection.create_channel
  end
end