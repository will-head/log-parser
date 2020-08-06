describe 'parser.rb' do
  it 'can list webpages ordered by page views' do
    expect { system %(./parser.rb ./data/feature_test.log) }.to output(<<~LIST_OF_WEBPAGES
      /home 8 visits
      /about/2 5 visits
      /contact 5 visits
      /about 2 visits
    LIST_OF_WEBPAGES
    ).to_stdout_from_any_process
  end

  it 'can list webpages ordered by uniqe page views' do
    expect { system %(./parser.rb --unique ./data/feature_test.log) }.to output(<<~LIST_OF_WEBPAGES
      /home 6 unique views
      /contact 4 unique views
      /about 2 unique views
      /about/2 2 unique views
    LIST_OF_WEBPAGES
    ).to_stdout_from_any_process
  end  
end
