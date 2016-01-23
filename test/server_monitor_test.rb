require 'test_helper'
require_relative '../lib/server_monitor'

class ServerMonitorTest < Minitest::Test
  def test_disk_usage
    usage = ServerMonitor.disk_usage
    assert_equal Float, usage.class
    assert usage > 0
  end
end
