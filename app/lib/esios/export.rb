module ESIOS
  class Export < Indicator
    def url
      "https://api.esios.ree.es/indicators/1739"
    end

    def geo_id
      Setting.instance.esios_country
    end
  end
end
