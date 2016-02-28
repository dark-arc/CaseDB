module LocationsHelper
  # @param [Location] parent parent of the new element
  # @param [Integer] parent parent of the new element
  # @return the path for a new "anatomy" with parent as the parent
  def new_child_location_path(parent)
    new_location_path(
      location: {
        parent_id: parent
      }
    )
  end
end
