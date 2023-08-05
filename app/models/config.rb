class Config
  include MissingSingleton

  def loop_interval
    ENV.fetch("SOLARIS_LOOP_INTERVAL", 30).to_i
  end

  def storage_interval
    ENV.fetch("SOLARIS_STORAGE_INTERVAL", 300).to_i
  end

  def esios_api_key
    ENV.fetch("ESIOS_API_KEY", nil)
  end

  def esios_country_geo_id
    ENV.fetch("ESIOS_COUNTRY_GEO_ID", 3).to_i
  end

  def esios_zone_geo_id
    ENV.fetch("ESIOS_ZONE_GEO_ID", 8741).to_i
  end
end
