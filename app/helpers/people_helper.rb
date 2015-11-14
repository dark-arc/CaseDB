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

end
