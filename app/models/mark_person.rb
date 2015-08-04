class MarkPerson < ActiveRecord::Base
  belongs_to :mark
  belongs_to :person
end
