# Sessions represent the active sessions on the website.
# @todo This is mostly future work.
class Session
  # Tell Rails that this is not to be persisted.
  def persisted?
    false
  end
end
