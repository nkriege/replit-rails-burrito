require 'test_helper'

class MeatTest < ActiveSupport::TestCase
  test 'creation' do
    meat = create(:meat)
    assert meat.valid?
  end
end
