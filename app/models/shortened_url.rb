class ShortenedUrl < ActiveRecord::Base
  #antes de crear manda a llamar al método mencionado
  before_create :create_short_url
  # Remember to create a migration!

  #validaciones correctas :D
  validates :long_url, presence: true, uniqueness: true, format: { with: URI.regexp }
  

#Intento de validaciones xD
  #def valid?(url)
  #  uri = URI.parse(url)
  #  uri.kind_of?(URI::HTTP)
  #rescue URI::InvalidURIError
  #  false
  #end

  #validates_format_of :long_url, with: /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix #No sirvió y marco error

  #cosilla a ver si sale
  private
  def create_short_url
    #aquí se crea la url corta, tiene self por que es un metodo de instancia y antes de crearlo se le asigna un valor a su atributo.
    self.short_url = "Yuk-" + (1..6).map{ ('a'..'z').to_a[rand(26)]}.join

  end
end
