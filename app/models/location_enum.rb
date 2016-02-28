# Enums for Location
# @see Location
module LocationEnum
  Location.enum level: [
    :unknown,
    :building,
    :street,
    :city,
    :town,
    :village,
    :county,
    :state,
    :country,
    :continent
  ]
end
