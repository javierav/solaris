module ESIOS
  class Import < Indicator
    def url
      "https://api.esios.ree.es/indicators/1001"
    end

    def geo_id
      Setting.instance.esios_zone
    end
  end
end
