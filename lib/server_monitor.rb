module ServerMonitor
  def self.cpu_usage
    proc0 = File.readlines('/proc/stat').grep(/^cpu /).first.split(' ')
    sleep 1
    proc1 = File.readlines('/proc/stat').grep(/^cpu /).first.split(" ")

    proc0usagesum = (1..3).map { |i| proc0[i].to_i }.reduce(:+)
    proc1usagesum = (1..3).map { |i| proc1[i].to_i }.reduce(:+)
    procusage = proc1usagesum - proc0usagesum

    proc0total = proc0usagesum + proc0[4].to_i
    proc1total = proc1usagesum + proc1[4].to_i
    
    proctotal = proc1total - proc0total

    cpuusage = procusage.to_f / proctotal.to_f
    cpuusagepercentage = (100 * cpuusage).to_f.round(2)
  end

  def self.disk_usage
    disk_free = `df`
    sum = 0
    
    disk_free.each_line.with_index do |line, index|
      next if index.eql? 0 # Header line
      next if line[0] =~ /localhost/  # OsX backup filesystem
      sum += line.split(' ')[2].to_f # Used line
    end

    sum.round(2)
  end

  def self.process_running
    fail "Not implemented yet"
  end
end
