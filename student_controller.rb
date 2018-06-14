require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/students.rb' )
also_reload( './models/*' )

# HOMEPAGE
get '/students' do
  @students = Student.all()
  erb( :index )
end

# new
get '/students/new' do
  erb( :new )
end

# SHOW
get '/students/:id' do
  @student = Student.find(params[:id].to_i())
  erb( :show )
end

 # create
post '/students' do
  @student = Student.new(params)
  @student.save
  erb( :create)
end
