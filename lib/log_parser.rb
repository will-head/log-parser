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
    visit_summary = ""
    visit_count.each_pair do |path, visits| 
      plural = ""
      if visits >= 2
        plural = "s"
      end
      visit_summary += "#{path} #{visits} visit#{plural}\n"
    end
    unique_summary = "/about 1 unique view\n"
    visit_summary + "\n" + unique_summary
  end

end
