require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require 'sinatra/reloader'   #Errors, so not included connection with sinatra-contrib, in Gemfile


get "/" do
  @bands = Band.all
  @venues = Venue.all
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

patch "/bands/:id" do
  band_id = params["id"].to_i
  @band = Band.find(band_id)
  @venue_ids = params["venue_ids"]
  @band.update({:venue_ids => @venue_ids})    #Problem Area?
  @venues = Venue.all
  erb :band_info
end

patch "/venues/:id" do
  venue_id = params["id"].to_i
  @venue = Venue.find(venue_id)
  @band_ids = params["band_ids"]
  if @band_ids
    @venue.update({:band_ids => @band_ids})   #problem area?
  end
  @bands = Band.all
  erb(:venue_info)
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


patch '/bands/:id/edit' do
  band_name = params["band_name"]
  band_id = params["id"].to_i
  @band = Band.find(band_id)
  @band.update({:band_name => band_name})
  erb :band
end

patch '/venues/:id/edit' do
  venue_name = params["venue_name"]
  venue_id = params["id"].to_i
  @venue = Venue.find(venue_id)
  @venue.update({:venue_name => venue_name})
  erb :venue
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
