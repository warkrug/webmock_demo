require 'test_helper'

class ThingTest < ActiveSupport::TestCase
  
  def test_name_by_json

    thing = things(:one)

    stub_request(:get, "http://localhost:3000/things/1.json").
      to_return(:status => 200, :body => thing.to_json, :headers => {})

    assert_equal thing.name, thing.name_by_json
  end

end
