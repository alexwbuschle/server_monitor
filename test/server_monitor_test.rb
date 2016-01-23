require 'test_helper'
require_relative '../lib/server_monitor'

class ServerMonitorTest < Minitest::Test
  def test_disk_usage
    usage = ServerMonitor.disk_usage
    assert_equal Float, usage.class
    assert usage > 0
  end

  def test_cpu_usage
    usage = ServerMonitor.cpu_usage
    assert_equal Float, usage.class
    assert usage > 0.0
  end

  def test_running_processes
    usage = ServerMonitor.running_processes
    assert usage.first[1] >= 0.0
    assert usage.first[2] >= 0.0
  end
end
