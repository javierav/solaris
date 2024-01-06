require "test_helper"

class CountryTest < ActiveSupport::TestCase
  test "create without code" do
    country = Country.new

    assert_not country.save
    assert country.errors.added?(:code, :blank)
  end

  test "create without name" do
    country = Country.new

    assert_not country.save
    assert country.errors.added?(:name, :blank)
  end

  test "create without p1_name" do
    country = Country.new

    assert_not country.save
    assert country.errors.added?(:p1_name, :blank)
  end

  test "create without p2_name" do
    country = Country.new

    assert_not country.save
    assert country.errors.added?(:p2_name, :blank)
  end

  test "create without p3_name" do
    country = Country.new

    assert_not country.save
    assert country.errors.added?(:p3_name, :blank)
  end

  test "create with duplicate code" do
    country = Country.new(code: "ES")

    assert_not country.save
    assert country.errors.added?(:code, :taken, value: "ES")
  end

  test "create with valid attributes" do
    country = Country.new(code: "UK", name: "United Kingdom", p1_name: "On-Peak", p2_name: "Standard", p3_name: "Off-Peak")

    assert country.save
  end

  test "associated with holidays" do
    assert_equal 16, countries(:es).holidays.count
  end
end
