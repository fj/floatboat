module Floatboat
  class Converter
    def self.to_bits(float)
      float_as_bytes = [float].pack('G').bytes
      float_as_bytes.map { |n| "%08b" % n }.join
    end

    def self.from_bits(bitstring)
      [bitstring].pack('B*').unpack('G').first
    end

    def self.binary_mantissa_to_decimal(binary_mantissa)
      explicit_mantissa = "1.#{binary_mantissa}"
      int, fraction = explicit_mantissa.split(".")
      minus = int.delete!("-")
      dec = (minus ? "-" : "") + int.to_i(2).to_s

      if fraction
        dec << (fraction.to_i(2) / 2.0**(fraction.size)).to_s[1..-1]
      else
        dec << ".0"
      end
    end
  end
end
