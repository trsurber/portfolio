
#main.rb page
get '/news' do
    require 'google-search'
    query = "mercer Football"
    @results - Array.new
    Google::Search::News.new do |search|
        search.query = query
        # search.size = :large
    end.each { |item| @results.push item }
    end
    erb :news
end

#new file in the views folder

# copied containers from twitter page
<div class="container">
    <div class-"row centered mt mb">
        <div class="col-lg-8 col-lg-offset-2">
                <h1>My News Stories</h1>
                <ul>
                <% @results.each do |result| %>
                    <li>
                        <a href="<%= result.uri %>"><%= result.title %></a> <%= result.content %>
                    </li>
                <% end %>
                </ul>
        </div>
    </div>
</div>                        