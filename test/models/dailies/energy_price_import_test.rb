require "test_helper"

module Dailies
  class EnergyPriceImportTest < ActiveSupport::TestCase
    test "create daily energy price import without max" do
      model = EnergyPriceImport.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:max, :blank)
      end
    end

    test "create daily energy price import without maxhour" do
      model = EnergyPriceImport.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:maxhour, :blank)
      end
    end

    test "create daily energy price import without min" do
      model = EnergyPriceImport.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:min, :blank)
      end
    end

    test "create daily energy price import without minhour" do
      model = EnergyPriceImport.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:minhour, :blank)
      end
    end

    test "create daily energy price import without avg" do
      model = EnergyPriceImport.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:avg, :blank)
      end
    end

    test "create daily energy price import" do
      model = EnergyPriceImport.new(date: Date.parse("2024-01-01"))

      assert_in_delta 0.1238, model.compute_max
      assert_in_delta 0, model.compute_maxhour
      assert_in_delta 0.0442, model.compute_min
      assert_in_delta 14, model.compute_minhour
      assert_in_delta 0.0906, model.compute_avg
    end
  end
end
