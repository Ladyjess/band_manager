require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require 'sinatra/reloader'   #Errors, so not included connection with sinatra-contrib, in Gemfile


get "/" do
  @bands = Band.all
  @venues = Venue.all
  @concerts = Concert.all   #In the end, only this will be listed,  not bands and venues separately
  erb :index
end

get "/bands" do
  @bands = Band.all
  erb :band
end

get "/venues" do
  @venues = Venue.all
  erb :venue
end

get "/concerts" do
  @concerts = Concert.all
  erb :concert
end

post "/bands" do
  band_name = params["band_name"]
  band = Band.create({:band_name => band_name})
  @bands = Band.all
  erb :band
end

post "/venues" do
  venue_name = params["venue_name"]
  venue = Venue.create({:venue_name => venue_name})
  @venues = Venue.all
  erb :venue
end

post "/concerts" do
  performance_date = params["performance_date"]
  concert = Concert.create({:performance_date => performance_date})
  @concerts = Concert.all
  erb :concert
end

get "/bands/:id" do
  @band = Band.find(params["id"].to_i)
  @venues = Venue.all
  erb :band_info
end

get "/venues/:id" do
  @venue = Venue.find(params["id"].to_i)
  @bands = Band.all
  erb :venue_info
end

get "/concerts/:id" do
  @band = Band.find(params["id"].to_i)
  @venue = Venue.find(params["id"].to_i)
  @concerts = Concert.all
  erb :concert_info
end


patch "/bands/:id" do
  band_id = params["id"].to_i
  @band = Band.find(band_id)
  @venue_ids = params["venue_ids"]
  @band.update({:venue_ids => @venue_ids})
  @venues = Venue.all
  erb :band_info
end

patch "/venues/:id" do
  venue_id = params["id"].to_i
  @venue = Venue.find(venue_id)
  @band_ids = params["band_ids"]
  if @band_ids
    @venue.update({:band_ids => @band_ids})
  end
  @bands = Band.all
  erb(:venue_info)
end

patch "/concerts/:id" do
  concert_id = params["id"].to_i
  @concert = Concert.find(concert_id)
  @venue_ids = params["venue_ids"]
  @band_ids = params["band_ids"]
  @concert.update({:venue_ids => @venue_ids, :band_ids => @band_ids})
  @venues = Venue.all
  @bands = Band.all
  erb :concert_info
end


get "/bands/:id/edit" do
  band_id = params["id"].to_i
  @band = Band.find(band_id)
  erb :band_edit
end

get "/venues/:id/edit" do
  venue_id = params["id"].to_i
  @venue = Venue.find(venue_id)
  erb :venue_edit
end

get "/concerts/:id/edit" do
  concert_id = params["id"].to_i
  @concert = Concert.find(concert_id)
erb :concert_edit
end

patch '/bands/:id/edit' do
  band_name = params["band_name"]
  band_id = params["id"].to_i
  @band = Band.find(band_id)
  @band.update({:band_name => band_name})
  @bands = Band.all
  erb :band
end

patch '/venues/:id/edit' do
  venue_name = params["venue_name"]
  venue_id = params["id"].to_i
  @venue = Venue.find(venue_id)
  @venue.update({:venue_name => venue_name})
  @venues = Venue.all
  erb :venue
end

patch '/concerts/:id/edit' do
  performance_date = params["concert_date"]
  concert_id = params["id"].to_i
  @concert = Concert.find(concert_id)
  @concert.update({:performance_date => performance_date})
  @concerts = Concert.all
  erb :concert
end

delete '/bands/:id/edit' do
  band_id = params["id"].to_i
  @band = Band.find(band_id)
  @band.destroy
  redirect "/"
end

delete '/venues/:id/edit' do
  venue_id = params["id"].to_i
  @venue = Venue.find(venue_id)
  @venue.destroy
  redirect "/"
end

delete '/concerts/:id/edit' do
  concert_id = params["id"].to_i
  @concert = Concert.find(concert_id)
  @concert.destroy
  redirect "/"
end
