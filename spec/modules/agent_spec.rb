require 'rails_helper'

RSpec.describe Agent do
  describe "Agent.fetch" do
    it "should return array" do
      course_codes = Agent.fetch(studentno: ENV['STUDENTNO'], idcard: ENV['IDCARD'], birthday: ENV['BIRTHDAY'], password: ENV['PASSWORD'])

      expect(course_codes.is_a?(Array)).to eq(true)
    end

  end
end

