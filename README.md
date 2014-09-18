# floatboat

Floatboat is a tiny Ruby library for peeking inside Ruby's IEEE 754 floating point representation.

## Installation

Add this line to your application's Gemfile:

    gem 'floatboat'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install floatboat

## Usage

```
f = 12.125

o = Floatboat::Oracle.new(12.125)
# => #<Floatboat::Oracle:0x007fb1f1a9f1f0
# @exponent="10000000010",
# @mantissa="1000010000000000000000000000000000000000000000000000",
# @n_exponent=3,
# @n_mantissa=1.515625,
# @n_sign=1,
# @sign="0",
# @value=12.125>

o.to_bit_components
# => ["0", "10000000010", "1000010000000000000000000000000000000000000000000000"]

o.to_numerical_components
# => [1, 3, 1.515625]

f == o.n_sign * 2**o.n_exponent * o.n_mantissa
# => true

f == o.to_f
# => true

o.to_f.nan?
# => false

o.to_f.infinite?
# => false

nan = Floatboat::Oracle.new(Float::NAN)
!!nan.to_f.nan?
# => true

inf = Floatboat::Oracle.new(Float::INFINITY)
!!inf.to_f.infinite?
# => true
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/floatboat/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
