require 'log_parser'

describe LogParser do 
  it "#summary('./data/test_log.log') includes '/home 1 visit'" do
    expect(subject.summary('./data/test_log.log')).to include "/home 1 visit"
  end

  it "#summary('./data/test_log.log') includes '/home 1 unique view'" do
    expect(subject.summary('./data/test_log.log')).to include "/home 1 unique view"
  end

  it "#summary('./data/test_log.log') includes '/about 1 visit'" do
    expect(subject.summary('./data/test_log.log')).to include "/about 1 visit"
  end

  it "#summary('./data/test_log.log') includes '/contact 2 visits'" do
    expect(subject.summary('./data/test_log.log')).to include "/contact 2 visits"
  end

  it "#summary('./data/test_log.log') includes '/about 1 visit\n/home 1 visit'" do
    expect(subject.summary('./data/test_log.log')).to include "/about 1 visit\n/home 1 visit"
  end

  it "#summary('./data/test_log.log') includes '/contact 2 visits\n/about 1 visit'" do
    expect(subject.summary('./data/test_log.log')).to include "/contact 2 visits\n/about 1 visit"
  end

  it "#summary('./data/test_log.log') includes '/about 1 unique view'" do
    expect(subject.summary('./data/test_log.log')).to include "/about 1 unique view"
  end

  it "#summary('./data/test_log.log') includes '/contact 1 unique view'" do
    expect(subject.summary('./data/test_log.log')).to include "/contact 1 unique view"
  end

  it "#summary('./data/test_log.log') includes '/people 2 unique views'" do
    expect(subject.summary('./data/test_log.log')).to include "/people 2 unique views"
  end

  it "#summary('no_log_file.log') to raise LogParser::FileNotFound with Error: File 'no_log_file.log' not found" do
    expect { subject.summary('no_log_file.log') }.to raise_error(LogParser::FileNotFound, "Error: File 'no_log_file.log' not found")
  end

  it "#summary('./data/empty_log.log') returns LogParser::FileEmpty with Error: File 'no_log_file.log' has no entries" do
    expect { subject.summary('./data/empty_log.log') }.to raise_error(LogParser::FileEmpty, "Error: File './data/empty_log.log' has no entries")
  end

  it "summary(nil) returns Usage: parser.rb logfile" do
    expect { subject.summary(nil) }.to raise_error(LogParser::NoFile, "Usage: parser.rb logfile")
  end

  it "summary('') returns Usage: parser.rb logfile" do
    expect { subject.summary('') }.to raise_error(LogParser::NoFile, "Usage: parser.rb logfile")
  end
end
