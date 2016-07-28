class CreateShortenedUrls < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.string  :short_url
      t.string  :long_url    #original url
      t.integer :visit_count, :default => 0 
    end
  end#change
end#class CreateShortenedUrls
