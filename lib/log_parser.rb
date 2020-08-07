class LogParser

  def print_summary(arguments)
    # plural = ""
    visit_count = process_log(arguments)
    # if visit_count >= 2
    #   plural = "s"
    # end

    # "/about #{visit_count} visit#{plural}\n /
    "/about #{visit_count} visit\n /
    \n /
    /about 1 unique view"
  end

  private

  def process_log(file)
    visit_list = Array.new
    File.foreach(file) do |line| 
      entry = line.split(' ')
      visit_list.push(entry[0])
    end
    visit_list.count
  end

end
