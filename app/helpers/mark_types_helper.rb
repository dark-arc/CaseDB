# Helper methods for MarkTypes Views
module MarkTypesHelper
  # @param [MarkType] parent parent of the new element
  # @param [Integer] parent parent of the new element
  # @return the path for a new "marktype" with parent as the parent
  def new_child_mark_type_path(parent)
    new_mark_type_path(
      mark_type: { 
        parent_id: parent
      }
    )
  end
end
