module ESIOS
  class Import < Indicator
    def indicator_id
      1001
    end

    def geo_id
      Rails.configuration.x.esios.zone
    end
  end
end
