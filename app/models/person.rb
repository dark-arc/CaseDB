# Person class contains the descriptions of people and a narative of
# their life.
class Person < ActiveRecord::Base
  include PersonEnum
  has_many :event_people
  # @!attribute events [rw]
  # @return [Relation<Event>] Narrative for this persons life
  has_many :events,
           through: :event_people
  # @!attribute case_files
  # @return [Relation<CaseFile>] Cases this person was involved in
  has_many :case_files,
           -> { distinct },
           through: :events
  validate :validate_birth_event_count,
           :validate_death_event_count

  # @!attribute [rw] aliases
  # A list of the person's aliases
  # @return [Relation<Alias>]
  has_many :aliases, dependent: :destroy
  accepts_nested_attributes_for :aliases,
                                allow_destroy: true

  # @!attribute [rw] marks
  # The {Mark}s for this person.
  has_many :marks

  # The name of the person. This will return the default {Alias}.
  # @return [String]
  def name
    aliases.default_name.first.name
  rescue
    aliases.first.name
  end

  # @return The person's birth date, or nil if no birth event.
  def dob
    if birth.empty?
      return nil
    else
      return birth.first.date
    end
  end

  # @return The person's death date, or nil if no death event.
  def dod
    if death.empty?
      return nil
    else
      return death.first.date
    end
  end
  # @!attribute birth
  # @return [CollectionProxy<Event>] birth event of this person

  # @!attribute death
  # @return [CollectionProxy<Event>] death event of this person

  # @!attribute victim
  # @return [CollectionProxy<Event>] events where this person was
  # a victim

  # @!attribute perpetrator
  # @return [CollectionProxy<Event>] events where this person was
  # a perpetrator

  # @!attribute investigator
  # @return [CollectionProxy<Event>] events where this person was
  # an investigator
  EventPerson.categories.each do |type|
    type = type[0].to_sym
    has_many type,
             -> { where 'event_people.category' => type },
             through: :event_people,
             source: :event
  end

  # Return the description of this person.
  # @return [Hash<String,String>] All description elements which are known.
  def description
    description = {}
    description_fields.each do |v|
      attr = self[v]
      next if attr == 'unknown' || attr.nil?
      field = Person.human_attribute_name(v)
      attr = Person.human_attribute_name(attr)
      description[field] = attr
    end
    description
  end

  private

  # Validate that only one birth event is allowed per person
  def validate_birth_event_count
    errors.add(:birth, :multipleBirthEvents) if birth.size > 1
  end

  # Validate that only one death event is allowed per person
  def validate_death_event_count
    errors.add(:death, :multipleDeathEvents) if death.size > 1
  end

  # The fields used to describe a person
  def description_fields
    [:ic, :gender, :height, :build, :eye_colour,
     :hair_length, :hair_colour, :beard, :moustache]
  end
end
