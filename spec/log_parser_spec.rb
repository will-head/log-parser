require 'log_parser'

describe LogParser do 
  it "#print_summary('./data/test_log.log') includes '/about 1 visit'" do
    expect(subject.print_summary('./data/test_log.log')).to include "/about 1 visit"
  end

  it "#print_summary('./data/test_log.log') includes '/about 1 unique view'" do
    expect(subject.print_summary('./data/test_log.log')).to include "/about 1 unique view"
  end

  it "#print_summary('./data/test_log.log') includes '/home 1 visit'" do
    expect(subject.print_summary('./data/test_log.log')).to include "/home 1 visit"
  end

  it "#print_summary('./data/test_log.log') includes '/contact 2 visits'" do
    expect(subject.print_summary('./data/test_log.log')).to include "/contact 2 visits"
  end
end
