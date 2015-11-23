module AnatomiesHelper

  def new_child_anatomy_path(parent)
    new_anatomy_path(
      anatomy: { 
        parent_id: parent
      }
    )
  end
end
