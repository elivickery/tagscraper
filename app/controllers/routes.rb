get '/' do
    erb :index
end

get '/scrape' do
    @source = open(params[:url]).read
    @source = @source.gsub('<','<br/>&#60;').gsub('>','&#62;<br/>')
    doc_string = Nokogiri::HTML(open(params[:url])).children
    tag_arr = doc_string.search('*').map(&:name)
    @tag_counts = Hash.new(0)
    tag_arr.each { |tag| @tag_counts[tag] += 1}

    erb :index
end
