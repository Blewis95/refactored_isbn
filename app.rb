require 'sinatra'
require_relative 'isbn.rb'

get '/' do
	erb :isbn
end

post '/isbn_validate' do 

	num = params[:isbn_input]

	# "I got #{params["isbn_input"]}."

	answer = valid_isbn?(num)

	"Answer is : #{answer}."
end