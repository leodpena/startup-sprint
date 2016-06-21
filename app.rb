require_relative 'config/environment'

class App < Sinatra::Base
    get '/' do
    @error = params['error']
    @name = params['name']
    @city = params['city']
    erb :home
end

get '/home' do
    @error = params['error']
    redirect to('/')
end

post '/subscribe' do
    @full_name = params[:full_name]
    @email = params[:email]
    @city = params[:city]

    if !@email.match(/.+@.+/)
        full_name = @full_name
        names = full_name.split(' ')

        @first_name = names[0]
        @last_name = names[1]
      redirect to('/?error=email&name=' + @full_name + '&city=' + @city)
    end

    erb :subscribe
end

get '/reddit' do
    # TODO: we can probably get the listings with something like:
    #JSON.parse(RestClient.get('http://reddit.com/.json'))

    require 'json'

    class Link
    attr_accessor :title, :url, :thumbnail

    def initialize(title, url, thumbnail)
    @title = title
    @url = url
    @thumbnail = thumbnail
end
end

data = JSON.parse(RestClient.get('http://reddit.com/.json'))

@listings = data['t3'].map { |rd| Link.new(rd['title'], rd['url'], rd['thumbnail'])}

erb :reddit
end

get '/rainbow' do

    erb :rainbow
end

  get '/team' do
    erb :team
end


  get '/youtube' do
    erb :youtube
end


  get '/schedule' do
    @today = [
    ['7:00am', 'Wake up'],
    ['8:00am', 'Work Out'],
    ['9:00am', 'Product Meeting'],
    ['11:00am', 'Ping Pong Break'],
    ['1:00pm', 'Lunch'],
    ['3:00pm', 'Coffee Time'],
    ['6:30pm', 'Call it a day'],
    ]

    @tomorrow = [
    ['7:00am', 'Wake up'],
    ['8:00am', 'Work Out'],
    ['9:00am', 'Inbox Zero'],
    ['11:00am', 'Ping Pong Break'],
    ['1:00pm', 'Lunch'],
    ['3:00pm', 'Coffee Time'],
    ['6:30pm', 'Meetup Presentation'],
    ]

    erb :schedule
end
end

class App < Sinatra::Base
    get '/fib/:n' do
    # TODO: implement an algorithm to calculate the fibonacci sequence at
    # the nth position and display
    # (4) points
end

get '/team-randomizer' do
    # TODO: provide a form with a textarea that asks for a list of comma
    # separated names. Randomize this list of names and display it as an
    # ordered list (<ol>). 5 points
end

def fib(n)
    # TODO: calculate fib
end
end
