require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./mieruka.db"
)

helpers do
  include Rack::Utils
  alias_method :h, :escape_html

end

class Before_mieruka < ActiveRecord::Base
end

class Imtok < ActiveRecord::Base
  has_many :syains
end

class Syain < ActiveRecord::Base
  belongs_to :imtok
end


get '/' do
  #@naiyoes = Before_mieruka.all
  @imtok = []
  @omisename = ""
  erb :index
end

post '/go' do

  imtok = Imtok.find_by_omise_code(params[:omise].to_i)
  @omisename = imtok.omise_name

  @imtok = []
  imtok.syains.each do |syain|
    @imtok.push(syain)
  end

  erb :index

end
