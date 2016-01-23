module ServerMonitor
  def self.cpu_usage
    fail "Not implemented yet"
  end

  def self.disk_usage
    disk_free = `df`
    sum = 0
    
    disk_free.each_line.with_index do |line, index|
      next if index.eql? 0 # Header line
      sum += line.split(' ')[2].to_f # Used line
    end

    sum.round(2)
  end

  def self.process_running
    fail "Not implemented yet"
  end
end
