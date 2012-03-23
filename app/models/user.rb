class User < ActiveRecord::Base
  serialize :open_id_data

  def name
    open_id_data["name"]["full_name"]
  end
end
