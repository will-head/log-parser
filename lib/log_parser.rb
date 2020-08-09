class LogParser
  class FileNotFound < StandardError; end
  class FileEmpty < StandardError; end
  class NoFile < StandardError; end

  def summary(logfile)
    raise(NoFile, "Usage: parser.rb logfile") if logfile.nil? || logfile.empty?
    raise(FileNotFound, "Error: File '#{logfile}' not found") unless File.exist?(logfile)

    log = process_log(logfile)
    raise(FileEmpty, "Error: File '#{logfile}' has no entries") if log.empty?

    visit_summary = format_summary(:visit, log)
    # log.uniq!
    unique_summary = format_summary(:unique, log)
    visit_summary + "\n" + unique_summary + "\n" 
  end

  private

  def format_summary(type, log)
    if type == :unique
      log.uniq!
    end
    list = create_list(log)
    count = create_count(list)
    format_count(type, count)
  end

  def process_log(file)
    log = Array.new

    File.foreach(file) do |line| 
      entry = line.split(' ')
      log.push({ entry[0] => entry[1] })
    end
    log
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
    label = type.to_s
    if label == "unique"
      label = "unique view"
    end
    summary = ""
    count = count.sort_by { |path, visits| [-visits, path] }.to_h
    count.each_pair do |path, visits| 
      summary += format_line(label, path, visits)
    end
    summary
  end

  def format_line(label, path, visits)
    "#{path} #{visits} #{label}#{format_plural(visits)}\n"
  end

  def format_plural(amount)
    amount >= 2 ? "s" : ""
  end

end
