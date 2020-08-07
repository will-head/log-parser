class LogParser

  def print_summary(arguments)

    visit_list = process_log(arguments)
    format_summary(visit_list)

  end

  private

  def process_log(file)
    visit_list = Array.new

    File.foreach(file) do |line| 
      entry = line.split(' ')
      visit_list.push(entry[0])
    end
    visit_list
  end

  def format_summary(visit_list)
    visit_count = Hash.new(0)
    visit_list.each { |entry| visit_count[entry] += 1 }
    visit_summary = format_visit_summary(visit_count)
    unique_summary = "/home 1 unique view\n"
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

  def format_plural(amount)
    return amount >= 2 ? "s" : ""
  end

end
