class ApplicationGateway
  def close
    raise NotImplementedError
  end

  def read(*)
    raise NotImplementedError
  end
end
