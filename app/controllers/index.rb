get '/' do
  #aquí está el submit del long_url
  # La siguiente linea hace render de la vista
  # que esta en app/views/index.erb
  @urls = ShortenedUrl.all
  erb :index
end

post '/urls' do
  #crea  una nueva Url
  #aquí se recibe el long_url y se crea el objeto.
  #find_or_create_by(attributes, &block) Find de FIRST record with the given attributes or creates a record with the attributes if one is not found.
  #This method it runs first a SELECT, and if there are no results an INSERT is attempted.
  @url = ShortenedUrl.find_or_create_by(long_url: params[:url_original])
  #p params #contiene un hash con url_original

  #tambien se puede hacer así
  #@url = ShortenedUrl.create(long_url: params[:url_original])
  #sin embargo si el objeto ya existe hay que hacer un if extra ya que se regresa un "objeto" con id = nil oseasele no se guardó por qué ya existe.

  if @url.valid?
    @urls = ShortenedUrl.all
    erb :index
  else
    @error = true
    erb :index
  end
  
end

get '/:short_url' do
  #redirige a la Url original
  short_url = params[:short_url]
  url = ShortenedUrl.find_by(short_url: short_url)
  if url
    redirect to( url.long_url )
  else
    erb :error
  end

end
