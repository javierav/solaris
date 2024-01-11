module ESIOS
  class Import < Indicator
    def url
      "https://api.esios.ree.es/indicators/1001"
    end

    def geo_id
      ENV.fetch("ESIOS_ZONE_GEO_ID", 8741).to_i
    end
  end
end
