module ESIOS
  class Toll < Indicator
    def url
      "https://api.esios.ree.es/indicators/1876"
    end

    def geo_id
      Setting.instance.esios_zone
    end
  end
end
