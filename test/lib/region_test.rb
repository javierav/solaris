require "test_helper"

class RegionTest < ActiveSupport::TestCase
  test "with default region" do
    assert_equal 1, Region.current.id
    assert_equal "pen", Region.current.key
    assert_equal "Península", Region.current.name
    assert_equal 8741, Region.current.esios
  end

  test "with region 1" do
    Rails.configuration.x.with(region: 1) do
      assert_equal 1, Region.current.id
      assert_equal "pen", Region.current.key
      assert_equal "Península", Region.current.name
      assert_equal 8741, Region.current.esios
    end
  end

  test "with region 2" do
    Rails.configuration.x.with(region: 2) do
      assert_equal 2, Region.current.id
      assert_equal "can", Region.current.key
      assert_equal "Islas Canarias", Region.current.name
      assert_equal 8742, Region.current.esios
    end
  end

  test "with region 3" do
    Rails.configuration.x.with(region: 3) do
      assert_equal 3, Region.current.id
      assert_equal "bal", Region.current.key
      assert_equal "Islas Baleares", Region.current.name
      assert_equal 8743, Region.current.esios
    end
  end

  test "with region 4" do
    Rails.configuration.x.with(region: 4) do
      assert_equal 4, Region.current.id
      assert_equal "ceu", Region.current.key
      assert_equal "Ceuta", Region.current.name
      assert_equal 8744, Region.current.esios
    end
  end

  test "with region 5" do
    Rails.configuration.x.with(region: 5) do
      assert_equal 5, Region.current.id
      assert_equal "mel", Region.current.key
      assert_equal "Melilla", Region.current.name
      assert_equal 8745, Region.current.esios
    end
  end
end
