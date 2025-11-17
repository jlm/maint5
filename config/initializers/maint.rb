# frozen_string_literal: true

# This is a way of supporting application-wide variables.
module Maint
  class Config
    Importing = false
    Committee = ENV["COMMITTEE"]
    Req_url = ENV["REQ_URL"]
  end
end
