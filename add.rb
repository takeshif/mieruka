require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./mieruka.db"
)

class Before_mieruka < ActiveRecord::Base
end

#before_mieruka = Before_mieruka.create(:syain_code => 1, :syain_name => "藤本")

p Before_mieruka.all
