describe 'parser.rb' do
  it 'can list webpages ordered by page views followed by unique views' do
    expect { system %(./parser.rb ./data/feature_test.log) }.to output(<<~LIST_OF_WEBPAGES
      /home 9 visits
      /about/2 5 visits
      /contact 5 visits
      /about 1 visit

      /home 6 unique views
      /contact 5 unique views
      /about/2 2 unique views
      /about 1 unique view
    LIST_OF_WEBPAGES
    ).to_stdout_from_any_process
  end
end
