module PeopleHelper

  def new_personal_event_path(person, type = :birth)
    new_event_path(
      :event => {
        :event_people_attributes => {
          "0" => {
            person_id: person,
            :category => type
          }
        }
      }
    )
  end

  def edit_mark_link(person,mark)
    link_to(t('.editMark'), edit_person_mark_path(person,mark))
  end
  
end
