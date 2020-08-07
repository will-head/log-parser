require 'log_parser'

describe LogParser do 
  it "#print_summary('single_line.log') returns '/about 1 visit'" do
    expect(subject.print_summary('single_line.log')).to include "/about 1 visit"
  end
end
