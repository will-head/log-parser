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

  end  
end
