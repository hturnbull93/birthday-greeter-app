require 'sinatra'
require 'date'

get '/' do
  erb :index
end

post '/' do
  @name = params[:name]
  @birthday = Date.parse("#{params[:month]} #{params[:day]}")
  @today = Date.today
  if @today == @birthday
    @result = "Happy Birthday #{@name}! 🥳"
  else
    @birthday += 365 if @birthday < @today
    @days_until_birthday = (@birthday - @today).to_i
    @day_wording = @days_until_birthday == 1 ? "day" : "days"
    @result = "Your birthday will be in #{@days_until_birthday} #{@day_wording}, #{@name}. 🕓"
  end

  erb :result
end
