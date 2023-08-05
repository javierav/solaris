module ESIOS
  class Import < Indicator
    def url
      "https://api.esios.ree.es/indicators/1001"
    end

    def geo_id
      Config.esios_zone_geo_id
    end
  end
end
