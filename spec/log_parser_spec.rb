require 'log_parser'

describe LogParser do 

  context "single line log" do
    let(:log) {
      [
        { "/home" => "061.945.150.735" }
      ]
    }

    it "1 visit" do
      allow(subject).to receive(:process_log).and_return(log)
      expect(subject.summary('./data/webserver.log')).to include "/home 1 visit\n"

    end

    it "1 unique view" do
      allow(subject).to receive(:process_log).and_return(log)
      expect(subject.summary('./data/webserver.log')).to include "/home 1 unique view\n"
    end
  end

  context "two lines, one path, one ip log" do
    let(:log) {
      [
        { "/home" => "061.945.150.735" },
        { "/home" => "061.945.150.735" }
      ]
    }

    it "2 visits" do
      allow(subject).to receive(:process_log).and_return(log)
      expect(subject.summary('./data/webserver.log')).to include "/home 2 visits\n"
    end

    it "1 unique view" do
      allow(subject).to receive(:process_log).and_return(log)
      expect(subject.summary('./data/webserver.log')).to include "/home 1 unique view\n"
    end
  end

  context "two lines, two paths, one ip log" do
    let(:log) {
      [
        { "/home" => "061.945.150.735" },
        { "/about" => "061.945.150.735" }
      ]
    }

    it "equal number of visits listed in alphabetical order" do
      allow(subject).to receive(:process_log).and_return(log)
      expect(subject.summary('./data/webserver.log')).to include "/about 1 visit\n/home 1 visit\n"
    end
  end

  context "three lines, two paths, one ip log" do
    let(:log) {
      [
        { "/home" => "061.945.150.735" },
        { "/about" => "061.945.150.735" },
        { "/about" => "061.945.150.735" }
      ]
    }

    it "number of visits in descending order" do
      allow(subject).to receive(:process_log).and_return(log)
      expect(subject.summary('./data/webserver.log')).to include "/about 2 visits\n/home 1 visit\n"      
    end
  end

  context "four lines, three paths, one ip log" do
    let(:log) {
      [
        { "/home" => "061.945.150.735" },
        { "/about" => "061.945.150.735" },
        { "/contact" => "061.945.150.735" },
        { "/contact" => "061.945.150.735" }
      ]
    }

    it "number of visits in descending order, equal visits alphabetical" do
      allow(subject).to receive(:process_log).and_return(log)
      expect(subject.summary('./data/webserver.log')).to include "/contact 2 visits\n/about 1 visit\n/home 1 visit\n"      
    end    
  end

  context "three lines, one path, two ip log" do
    let(:log) {
      [
        { "/home" => "126.318.035.038" },
        { "/home" => "444.701.448.104" },
        { "/home" => "444.701.448.104" }
      ]
    }

    it "3 visits" do
      allow(subject).to receive(:process_log).and_return(log)
      expect(subject.summary('./data/webserver.log')).to include "/home 3 visits\n"
    end

    it "2 unique views" do
      allow(subject).to receive(:process_log).and_return(log)
      expect(subject.summary('./data/webserver.log')).to include "/home 2 unique views\n"
    end
  end

  context "file input" do
    it "can read input file" do
      expect(subject.summary('./data/feature_test.log')).to include "/home 9 visits\n"
    end

    it "file doesn't exist raises FileNotFound error" do
      expect { subject.summary('no_log_file.log') }.to raise_error(LogParser::FileNotFound, "Error: File 'no_log_file.log' not found")
    end

    it "empty log file raises FileEmpty error" do
      expect { subject.summary('./data/empty_log.log') }.to raise_error(LogParser::FileEmpty, "Error: File './data/empty_log.log' has no entries")
    end

    it "nil filename raises NoFile error" do
      expect { subject.summary(nil) }.to raise_error(LogParser::NoFile, "Usage: parser.rb logfile")
    end

    it "empty string filename raises NoFile error" do
      expect { subject.summary('') }.to raise_error(LogParser::NoFile, "Usage: parser.rb logfile")
    end
  end
end
