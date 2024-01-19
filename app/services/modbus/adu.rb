module Modbus
  class ADU
    attr_reader :header, :pdu

    delegate :transaction, :unit, to: :header
    delegate :function, :get, :put, to: :pdu
    delegate :address, :quantity, to: :get

    def self.create_request(transaction, unit, register)
      new(
        TCPHeader.new(transaction:, unit:),
        Request.new(function: 3, get: { address: register.address, quantity: register.quantity })
      )
    end

    def self.parse_response(binary_string)
      raise StandardError, "Invalid binary string" if binary_string.bytesize < 7

      new(
        TCPHeader.read(binary_string[0...7]),
        Response.read(binary_string[7..])
      )
    end

    def initialize(header, pdu)
      @header = header
      @pdu = pdu
    end

    def to_binary_s
      binary_pdu = @pdu.to_binary_s
      header.request_length = binary_pdu.bytesize + 1
      "#{header.to_binary_s}#{binary_pdu}"
    end

    def to_hex
      hex_pdu = @pdu.to_hex
      header.request_length = @pdu.to_binary_s.bytesize + 1
      "#{header.to_hex}#{hex_pdu}"
    end

    def to_debug
      to_hex.chars.each_slice(2).map { |byte| "[#{byte.join}]" }.join
    end
  end
end
