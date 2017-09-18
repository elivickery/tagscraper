require 'sinatra/json'

get '/' do
    erb :index
end

get '/scrape' do
    @source = open(params[:url], :read_timeout => 30).read
    @source = @source.gsub('<','<br/>&#60;').gsub('>','&#62;<br/>')
    doc_string = Nokogiri::HTML(open(params[:url])).children
    tag_arr = doc_string.search('*').map(&:name)
    @tag_counts = Hash.new(0)
    tag_arr.each { |tag| @tag_counts[tag] += 1}

    if request.xhr?

        response = {
            source: @source,
            tags: @tag_counts
        }

        erb :_results, :layout => false
    else
        erb :index
    end
end
