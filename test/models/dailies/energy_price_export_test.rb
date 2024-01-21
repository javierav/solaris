require "test_helper"

module Dailies
  class EnergyPriceExportTest < ActiveSupport::TestCase
    test "create daily energy price export without max" do
      model = EnergyPriceExport.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:max, :blank)
      end
    end

    test "create daily energy price export without maxhour" do
      model = EnergyPriceExport.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:maxhour, :blank)
      end
    end

    test "create daily energy price export without min" do
      model = EnergyPriceExport.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:min, :blank)
      end
    end

    test "create daily energy price export without minhour" do
      model = EnergyPriceExport.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:minhour, :blank)
      end
    end

    test "create daily energy price export without avg" do
      model = EnergyPriceExport.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:avg, :blank)
      end
    end

    test "create daily energy price export" do
      model = EnergyPriceExport.new(date: Date.parse("2024-01-01"))

      assert_in_delta 0.0611, model.compute_max
      assert_in_delta 0, model.compute_maxhour
      assert_in_delta 0.0002, model.compute_min
      assert_in_delta 14, model.compute_minhour
      assert_in_delta 0.0344, model.compute_avg
    end
  end
end
