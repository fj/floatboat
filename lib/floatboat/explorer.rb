module Floatboat
  class Converter
    def self.to_bits(float)
      float_as_bytes = [float].pack('G').bytes
      float_as_bytes.map { |n| "%08b" % n }.join
    end

    def self.to_float_components

    def self.from_bits(bitstring)

    end

    def self.from_byte_array(bytes)

    end
  end
end
