require 'sinatra'
require_relative 'isbn.rb'
enable :sessions

get '/' do
	erb :isbn
end

post '/isbn_validate' do 

	session[:num] = params[:isbn_input]

	erb :isbn_num
end

post '/ask_name' do
	session[:name] = params[:name_input]

	erb :age
end

post '/ask_age' do
	session[:age] = params[:age_input]

	answer = valid_isbn?(session[:num])

	erb :display, :locals => {:name => session[:name], :age => session[:age], :num => session[:num], :answer => answer}


end