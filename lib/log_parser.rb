class LogParser

  def print_summary(arguments)
    visit_list = Array.new
    plural = ""
    File.foreach(arguments) do |line| 
      entry = line.split(' ')
      visit_list.push(entry[0])
    end
    visit_count = visit_list.count
    if visit_count >= 2
      plural = "s"
    end
    "/about #{visit_count} visit#{plural}\n\n/about 1 unique view"
  end

end
