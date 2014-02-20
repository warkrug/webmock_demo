class Thing < ActiveRecord::Base

  def name_by_json
    data['name']
  end

  def uri
    URI "http://localhost:3000/things/1.json"
  end

  def json_data
    Net::HTTP.get uri
  end

  def data
    JSON.parse json_data
  end
end
