class LogParser

  def print_summary(arguments)
    log = process_log(arguments)
    format_summary(log)
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

  def format_summary(log)
    visit_summary = format_visit_summary(log)
    unique_summary = format_unique_summary(log)

    visit_summary + "\n" + unique_summary
  end

  def format_visit_summary(log)
    visit_list = create_list(log)
    visit_count = create_count(visit_list)

    visit_summary = ""
    visit_count = visit_count.sort_by { |path, visits| [-visits, path] }.to_h
    visit_count.each_pair do |path, visits| 
      visit_summary += format_visit_line(path, visits)
    end
    visit_summary
  end

  def format_visit_line(path, visits)
    "#{path} #{visits} visit#{format_plural(visits)}\n"
  end

  def format_unique_summary(log)
    log.uniq!
    unique_list = create_list(log)
    unique_count = create_count(unique_list)

    unique_summary = ""
    unique_count = unique_count.sort_by { |path, visits| [-visits, path] }.to_h

    unique_count.each_pair do |path, visits| 
      unique_summary += "#{path} #{visits} unique view#{format_plural(visits)}\n"
    end

    unique_summary
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

  def format_plural(amount)
    return amount >= 2 ? "s" : ""
  end

end
