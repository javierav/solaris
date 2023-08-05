module ESIOS
  class Export < Indicator
    def url
      "https://api.esios.ree.es/indicators/1739"
    end

    def geo_id
      Config.esios_country_geo_id
    end
  end
end
