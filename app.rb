require 'sinatra'
require 'httparty'

get '/' do 
  erb :home
end

get '/:theme' do
  data = get_data()
  settings = get_settings()
  view = get_view()
  kol_response = HTTParty.post("https://api.kickofflabs.com/templates", body: {data: data, settings: settings, view: view})
  kol_response.body
  
end

post /.*/ do 
  content_type :json
  kol_response = HTTParty.post("https://api.kickofflabs.com/templates/subscribe", body: params)
  kol_response.body
end


def get_data
  read_file('data.yml')
end

def get_settings
  read_file('settings.yml')
end

def get_view()
  read_file('view.html')
end

def read_file(file_name)
  File.read(File.join(File.dirname(__FILE__), 'themes', params[:theme],  file_name))
end
