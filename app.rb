require "sinatra"
require "sinatra/reloader" if development?
require "./database"
require "json"

get '/home' do 
  @DB = DB
  @comments = COMMENTS
  @array = []
  @all_comments = []
  @each_group_of_comments = []
  @DB.each { |item| @array << item[:title]}

  # testing looping on array
  @comments.each_with_index do |outer_array_elements, outer_index| 
    outer_array_elements.each_with_index  do |inner_array_elements, inner_index| #@all_comments << inner_array_elements
      #puts inner_array_elements.inspect
    end
  end

  @comments.each_with_index {|item, index| @each_group_of_comments << item} # push in array all group of comment
  @each_group_of_comments.each_with_index do |item, index| @all_comments << item
    puts @all_comments[index]
  end

  #puts @each_group_of_comments
  erb :list_title
end


# I wanted to implement clicking on title of the articles on /home and changing view so when you click on "ReadMore" it changes the url 
# in the browser then you get that request and navigate to new a page to see the whole article but I don't know why the program can't catch
# this route, same for the other articles
# I volontary let the error so that you can help me out

get '/Mon%20premier%20article' do  
  "HELLO WORLD"
  erb :layout
end



