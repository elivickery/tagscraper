get '/' do
    erb :index
end

get '/scrape' do
    @source = open(params[:url]).read
    @source = @source.gsub('<','<br/>&#60;').gsub('>','&#62;<br/>')

    doc_string = Nokogiri::HTML(open(params[:url])).children

    erb :index
end
