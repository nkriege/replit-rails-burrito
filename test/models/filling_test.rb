require 'test_helper'

class FillingTest < ActiveSupport::TestCase
  test 'creation' do
    filling = create(:filling)
    assert filling.valid?
  end
end
