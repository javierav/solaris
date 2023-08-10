module ESIOS
  class Export < Indicator
    def url
      "https://api.esios.ree.es/indicators/1739"
    end

    def geo_id
      ENV.fetch("ESIOS_COUNTRY_GEO_ID", 3).to_i
    end
  end
end
