module MarkTypesHelper
  def new_child_mark_type_path(parent)
    new_mark_type_path(
      mark_type: { 
        parent_id: parent
      }
    )
  end
end
