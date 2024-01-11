class ApplicationProtocol
  def name
    raise NotImplementedError
  end

  def gateways
    raise NotImplementedError
  end

  def solar_power
    raise NotImplementedError
  end

  def solar_energy
    raise NotImplementedError
  end

  def grid_power
    raise NotImplementedError
  end

  def grid_energy_export
    raise NotImplementedError
  end

  def grid_energy_import
    raise NotImplementedError
  end

  def model
    raise NotImplementedError
  end

  def serial_number
    raise NotImplementedError
  end

  def firmware_version
    raise NotImplementedError
  end
end
