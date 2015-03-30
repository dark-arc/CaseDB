class CaseFile < ActiveRecord::Base
	has_many :events, -> {order('date')}, counter_cache: true, inverse_of: :case_file
  has_many :people, -> {distinct}, :through => :events, counter_cache: true
  validates :name, 
      presence:	true,
      uniqueness: true,
      format: {with: /\A[a-zA-Z0-9 ]+\z/, message: I18n.t(:validation_alnum) },
      length: {minimum: 5}
  validates :brief, 
      presence: true, 
      length: {minimum: 2}

	accepts_nested_attributes_for :events
  
  def self.search(criteria)
    criteria = "%"+criteria.to_s+"%"
    where('name LIKE ?', criteria)
  end
end

