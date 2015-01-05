module ApplicationHelper

  def broadcast(channel, &block)
    message = { channel: channel, data: capture(block) }
  end
end
