# Enums for Person module.
# @see Person
module PersonEnum
  # @!attribute gender
  # @return [Symbol] The gender of this person.
  Person.enum gender: [
    :unknown,
    :male,
    :female,
    :asexual,
    :transmale,
    :transfemale
  ], _prefix: true
  # @!attribute eye
  # @return [Symbol] The eye colour of this person.
  Person.enum eye_colour: [
    :unknown,
    :lightBlue,
    :blue,
    :blueGray,
    :gray,
    :blueGrayBrown,
    :grayGreenBrown,
    :green,
    :greenBrown,
    :lightBrown,
    :brown,
    :hazel,
    :darkBrown,
    :black
  ], _suffix: 'eyes'
  # @!attribute height
  # @return [Symbol] The height of this person.
  Person.enum height: [
    :unknown,
    :dwarf,
    :short,
    :average,
    :tall
  ], _prefix: true
  # @!attribute weight
  # @return [Symbol] The weight of this person.
  Person.enum build: [
    :unknown,
    :slight,
    :average,
    :overweight,
    :obese
  ], _prefix: true
  # @!attribute hair_colour
  # @return [Symbol] The hair_colour of this person.
  Person.enum hair_colour: [
    :unknown,
    :black,
    :brown,
    :blond,
    :auburn,
    :chestnut,
    :red,
    :gray
  ], _suffix: true
  # @!attribute hair_length
  # @return [Symbol] The hair_length of this person.
  Person.enum hair_length: [
    :unknown,
    :bald,
    :short,
    :medium,
    :shoulderLength,
    :backLength
  ], _suffix: true
  # @!attribute moustache
  # @return [Symbol] The type of moustache the person had
  Person.enum moustache: [
    :unknown,
    :none,
    :handleBar,
    :toothbrush
  ], _prefix: true
  # @!attribute gender
  # @return [Symbol] The type of beard the person had
  Person.enum beard: [
    :unknown,
    :clean,
    :stubble,
    :soulPatch,
    :full,
    :muttonChops,
    :long,
    :medium
  ], _prefix: true
  # @!attribute ics
  # @return [Symbol] The ICS code of the person
  Person.enum ic: [
    :unknown,
    :northEurope,
    :southEurope,
    :black,
    :westAsia,
    :eastAsia,
    :arabic
  ], _prefix: true
end
