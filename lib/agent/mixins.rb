require 'httpclient'
require 'nokogiri'

module Agent
module Mixins
  module ClassMethods

  end

  module InstanceMethods
    attr_reader :doc

    def http_client
      @clnt ||= HTTPClient.new
    end

    def set_doc str
      ec = nil
      str.match(/charset=\".+\"/) { |m| ec = m[0].to_s.downcase }

      ic = Iconv.new("#{ec}//translist//IGNORE", 'utf-8') if ec

      new_content = ic && ic.iconv(str) || str
      @doc = Nokogiri::HTML(new_content)
    end

    def view_state
      @doc && Hash[ @doc.css('input[type="hidden"]').map{|input| [input[:name], input[:value]]} ]
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
end
