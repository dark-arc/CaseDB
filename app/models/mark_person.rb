# MarkPerson provides a link between the associated tables and adds an
# additional description of the mark. This helps to differentiate gang
# tattoos and piercings which will all be the same mark but also have
# differences
class MarkPerson < ActiveRecord::Base
  belongs_to :mark
  belongs_to :person
end
