require 'log_parser'

describe LogParser do 
  it "#print_summary('./data/single_line.log') returns '/about 1 visit'" do
    expect(subject.print_summary('./data/single_line.log')).to include "/about 1 visit"
  end

  it "#print_summary('./data/single_line.log') returns '/about 1 unique view'" do
    expect(subject.print_summary('./data/single_line.log')).to include "/about 1 unique view"
  end

  it "#print_summary('./data/two_line_single_ip.log') returns '/about 2 visits'" do
    expect(subject.print_summary('./data/two_line_single_ip.log')).to include "/about 2 visits"
  end
end
