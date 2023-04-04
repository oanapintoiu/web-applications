require 'sinatra/base'
# require 'sinatra/reloader'

class Application < Sinatra::Base
  get '/' do
    return "Hello!"
  end

  get '/hello' do
    return erb(:index)
    # name = params[:name]
    # return "Hello #{name}!"
  end

  get '/names' do
    name = params[:name]
    return name
  end

  post '/submit' do
    name = params[:name]
    message = params[:message]

    return "Thanks #{name}, you sent this message \"#{message}\""
  end

  post '/sort_names' do
    names = params[:names]

    return names.split(",").sort.join(",")
  end
end

#     get '/hello' do
#         name = params[:name] # The value is 'David'

#         # Do something with `name`...

#         return "Hello #{name}"
#       end

#       get '/posts' do
#         name = params[:name]
#         cohort_name = params[:cohort_name]

#         return "Hello #{name}, you are cohort #{cohort_name}."
#       end

#       post '/posts' do
#         title = params[:title]

#         return "Post was created with title #{title}"
#     end
# end

#   # This allows the app code to refresh
#   # without having to restart the server.
#   configure :development do
#     register Sinatra::Reloader
#   end

#   # Declares a route that responds to a request with:
#   #  - a GET method
#   #  - the path /
#   get '/' do
#     # The code here is executed when a request is received and we need to
#     # send a response.

#     # We can return a string which will be used as the response content.
#     # Unless specified, the response status code will be 200 (OK).
#     return 'Some response data'
#   end
# end
