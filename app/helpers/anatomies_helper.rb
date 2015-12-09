# Helper methods for Anatomy Views
module AnatomiesHelper

  # @param [Anatomy] parent parent of the new element
  # @param [Integer] parent parent of the new element
  # @return the path for a new "anatomy" with parent as the parent
  def new_child_anatomy_path(parent)
    new_anatomy_path(
      anatomy: { 
        parent_id: parent
      }
    )
  end
end
