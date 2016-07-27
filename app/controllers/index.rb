get '/' do
  #aquí está el submit del long_url
  # La siguiente linea hace render de la vista
  # que esta en app/views/index.erb
  erb :index
end

post '/urls' do
  #crea  una nueva Url
  #aquí se recibe el long_url y se crea el objeto.
  #find_or_create_by(attributes, &block) Find de FIRST record with the given attributes or creates a record with the attributes if one is not found.
  #This method it runs first a SELECT, and if there are no results an INSERT is attempted.
  @url = ShortenedUrl.find_or_create_by(long_url: params[:url_original])
  if @url.valid?
    erb :index
  else
    erb :error
  end
  
end

get '/:short_url' do
  #redirige a la Url original

end
