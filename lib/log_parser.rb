class LogParser

  def print_summary(arguments)
    log = process_log(arguments)

    # visit_list = Array.new
    # log.each do |line|
    #   visit_list.push(line.keys[0].to_s)
    # end
    # format_summary(visit_list)
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

    visit_list = Array.new
    log.each do |line|
      visit_list.push(line.keys[0].to_s)
    end
    # p visit_list
    visit_count = Hash.new(0)
    visit_list.each { |entry| visit_count[entry] += 1 }
    visit_summary = format_visit_summary(visit_count)

    unique_summary = format_unique_summary(log)

    visit_summary + "\n" + unique_summary
  end

  def format_visit_summary(visit_count)
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
    # p log

    unique_list = Array.new
    log.each do |line|
      unique_list.push(line.keys[0].to_s)
    end
    # p unique_list
    unique_count = Hash.new(0)
    unique_list.each { |entry| unique_count[entry] += 1 }
    # p unique_count
    unique_summary = ""
    unique_count = unique_count.sort_by { |path, visits| [-visits, path] }.to_h
    # p unique_count
    unique_count.each_pair do |path, visits| 
      unique_summary += "#{path} #{visits} unique view#{format_plural(visits)}\n"
    end
    # "/home 1 unique view\n"
    unique_summary
  end

  def format_plural(amount)
    return amount >= 2 ? "s" : ""
  end

end
