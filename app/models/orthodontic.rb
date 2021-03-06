class Orthodontic < ActiveRecord::Base
  audited
  Audited.current_user_method = :username
  attr_accessible :full_name, :address, :age, :occupation, :mobile_no, :resident_no, :status, :birth_date, :sex, :reffered_by, :birthplace, :examination_date, :examination_result

	# "sexy" validations
  REGEX = /^([^\d\W]|[-\s])*$/

	validates :full_name, :presence => true, :format => { :with => REGEX }, :uniqueness => true, :length => {:maximum => 50}
	validates :address, :presence => true, :length => {:maximum => 80}
	validates :age, :presence => true
	validates :mobile_no, :presence => true, :length => {:maximum => 15}

	def self.search(search, page)	
		paginate :per_page => 10, :page => page,
				 :conditions => ['full_name || lower(full_name) LIKE ?', "%#{search}%"],
				 :order => 'full_name'
	end

  # Summary of the outpatient

  def self.total_on(date)
    where("date(created_at) = ?", date).count(:full_name)
  end

end
