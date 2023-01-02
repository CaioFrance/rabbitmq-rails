class ProducesController < ApplicationController

  def produce
    pub = PublisherService.new
    pub.exchange("test.fanout")
    queue = pub.queue("test.a", "q2")
    payload = params[:message].to_json
    
    pub.publish_message(queue.name, payload)
    pub.close_connection
  end

end