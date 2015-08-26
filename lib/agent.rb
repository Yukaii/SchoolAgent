require 'agent/ntust_agent'

module Agent
  class << self
    def agent
      @ntust_agent ||= NtustAgent.new
    end

    def fetch(*args)
      agent.fetch(*args)
    end
  end

end
