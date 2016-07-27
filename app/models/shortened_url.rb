class ShortenedUrl < ActiveRecord::Base
  # Remember to create a migration!

  #Intento de validaciones xD
  validates :long_url, presence: true, uniqueness: true
  validates_format_of :long_url, with: /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix

end
