# Helper methods for people views
module PeopleHelper
  # @param [Person] person person to attach event to
  # @param [Integer] person person id to attach event to
  # @param [Symbol] type of event, defaults to :birth
  # @return path to create a new event for this person
  def new_personal_event_path(person, type = :birth)
    new_event_path(
      event: {
        event_people_attributes: {
          '0' => {
            person_id: person,
            category: type
          }
        }
      }
    )
  end

  # @param [Person] person person
  # @mark [Mark] mark to edit
  # @return Link to edit a person's mark
  def edit_mark_link(person, mark)
    link_to(t('.editMark'), edit_person_mark_path(person, mark))
  end
end
