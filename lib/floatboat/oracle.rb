module Floatboat
  class Oracle
    # From IEEE 754 double-precision floats.
    SIGN_BITSIZE     = 1
    EXPONENT_BITSIZE = 11
    MANTISSA_BITSIZE = 53
    EXPONENT_BIAS    = (2**(EXPONENT_BITSIZE - 1)) - 1

    attr_reader :sign, :exponent, :mantissa
    attr_reader :n_sign, :n_exponent, :n_mantissa

    def initialize(f)
      @value = f
      bits = ::Floatboat::Converter.to_bits(@value)

      @sign     = bits[0]
      @exponent = bits[1..11]
      @mantissa = bits[12..63]

      @n_sign     = @sign == "0" ? 1 : -1
      @n_exponent = @exponent.to_i(2) - EXPONENT_BIAS
      @n_mantissa = ::Floatboat::Converter.binary_mantissa_to_decimal(@mantissa).to_f
    end

    def to_bit_components
      [
        sign,
        exponent,
        mantissa
      ]
    end

    def to_numerical_components
      [
        n_sign,
        n_exponent,
        n_mantissa
      ]
    end

    def to_f
      @to_f ||= compute_float_value
    end

    def compute_float_value
      case @value
      when Float::INFINITY
        @value
      else
        (@value.nan?) ? Float::NAN : 2**n_exponent * n_mantissa * n_sign
      end
    end
  end
end
