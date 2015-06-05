def logged_in?
  if session[:user_id] == nil
    false
  else
    true
  end
end



get '/' do
  # Look in app/views/index.erb
  # show all photos
  @photos = Photo.all
  erb :index
end

get '/login' do

  #show login & create user

  erb :login
end

post '/login' do

 @user = User.authenticate(params[:username], params[:password])

 if @user
    session[:user_id] = @user.id
    redirect to "/users/#{@user.id}"
 else
    redirect to "/login"
 end

end

post '/create_user' do
  @user = User.new(params[:user])

  if @user.save
  redirect to "/users/#{@user.id}"
  else
  redirect to "/login"
  end

end

get '/users/:user_id' do

  @user = User.find(params[:user_id])
@album = Album.all
  @photos = Photo.all

  # @photos = @user.photos if !@user.photos.nil?

 erb :user
end

get '/users/:user_id/albums' do
@photos = Photo.all
  @user =  User.find(params[:user_id])
  @album = Album.all
#show all albums
  erb :'/user/album'
end




post '/users/:user_id/album' do

@user = User.find(params[:user_id])
# @album = Album.create(name: params[:name], user_id: @user.id)
@album = Album.create(name: params[:name], user_id: @user.id)

redirect to "/#{@album.id}/upload"

end



get "/:album_id/upload" do
  @album = Album.find(params[:album_id])


erb :'/album/upload'
end



post '/:album_id/photos' do
  # File.open('../../db/images' + params['filename'][:filename], "w") do |f|
  #   f.write(params['myfile'][:tempfile].read)
  # end

    @user = User.find(session[:user_id])

    @photo = @user.albums.find(params[:album_id]).photos.new()
    # @photo = Photo.new
    @album = Album.find(params[:album_id])
    @photo.file = params[:image]

    @photo.save

    redirect to "/albums/#{@album.id}/#{@photo.id}"
end


get '/albums/:album_id/:photo_id' do
   @photo = Photo.find(params[:photo_id])

   erb :'/photo/show'
end

get '/photo/:id' do


end

