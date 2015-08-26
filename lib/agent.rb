require 'agent/ntust_agent'

# 這邊未來可以抽換不同學校

module Agent
  class << self
    def agent
      @ntust_agent ||= NtustAgent.new
    end

    def fetch *args
      agent.fetch *args
    end
  end

end
