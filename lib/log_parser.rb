class LogParser

  def summary(arguments)
    log = process_log(arguments)
    visit_summary = format_summary('visit', log)
    log.uniq!
    unique_summary = format_summary('unique view', log)
    visit_summary + "\n" + unique_summary
  end

  private

  def process_log(file)
    log = Array.new

    File.foreach(file) do |line| 
      entry = line.split(' ')
      log.push({ entry[0] => entry[1] })
    end
    log
  end

  def format_summary(type, log)
    list = create_list(log)
    count = create_count(list)
    format_count(type, count)
  end

  def create_list(log)
    list = Array.new
    log.each { |line| list.push(line.keys[0].to_s) }
    list
  end

  def create_count(list)
    count = Hash.new(0)
    list.each { |entry| count[entry] += 1 }
    count
  end

  def format_count(type, count)
    summary = ""
    count = count.sort_by { |path, visits| [-visits, path] }.to_h
    count.each_pair do |path, visits| 
      summary += format_line(type, path, visits)
    end
    summary
  end

  def format_line(type, path, visits)
    "#{path} #{visits} #{type}#{format_plural(visits)}\n"
  end

  def format_plural(amount)
    return amount >= 2 ? "s" : ""
  end

end
