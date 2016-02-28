require 'test_helper'

# Tests for the Alias model
class AliasTest < ActiveSupport::TestCase
  def setup
    @person = FactoryGirl.create :person
  end

  test 'one default per person' do
    FactoryGirl.create(
      :alias, person: @person, default: true
    ).save
    FactoryGirl.create(
      :alias, person: @person, default: true
    ).save
    assert_equal 1, Alias.person(@person).where(default: true).count
  end

  test 'no duplicate names' do
    assert_raise ActiveRecord::RecordInvalid do
      FactoryGirl.create(
        :alias,
        person: @person,
        default: false,
        name: 'test'
      )
      FactoryGirl.create(
        :alias,
        person: @person,
        default: false,
        name: 'test'
      )
    end
  end
end
