require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  it "creates a category" do
    Category.create(name: "pass")
    _(Category.all.map(&:name)).must_equal ['pass']
  end
end
