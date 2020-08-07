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
end
