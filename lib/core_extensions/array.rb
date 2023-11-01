# https://github.com/rmodbus/rmodbus/issues/57
class Array
  def to_32u
    raise "Array requires an even number of elements to pack to 32bits: was #{size}" unless size.even?

    each_slice(2).map { |(msb, lsb)| [msb, lsb].pack("n*").unpack1("N") }
  end

  # Given an array of 16bit Fixnum, we turn it into 32bit unsigned int in little-endian order, halving the size
  def to_32u_le
    raise "Array requires an even number of elements to pack to 32bits: was #{size}" unless size.even?

    each_slice(2).map { |(lsb, msb)| [msb, lsb].pack("n*").unpack1("N") }
  end

  def to_signed32(number)
    number >= 2_147_483_648 ? number - 4_294_967_296 : number
  end

  # Given an array of 16bit Fixnum, we turn it into 32bit signed int in big-endian order, halving the size
  def to_32i
    raise "Array requires an even number of elements to pack to 32bits: was #{size}" unless size.even?

    to_32u.map { |n| to_signed32(n) }
  end

  # Given an array of 16bit Fixnum, we turn it into 32bit signed int in little-endian order, halving the size
  def to_32i_le
    raise "Array requires an even number of elements to pack to 32bits: was #{size}" unless size.even?

    to_32u_le.map { |n| to_signed32(n) }
  end

  def to_enum_hash
    to_h { |e| [e.to_s, e.to_s] }
  end
end
