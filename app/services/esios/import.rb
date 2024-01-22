module ESIOS
  class Import < Indicator
    def indicator_id
      1001
    end

    def geo_id
      Region.current.esios
    end
  end
end
