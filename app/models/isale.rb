class Isale < ActiveRecord::Base
	belongs_to :pharmacy
	belongs_to :provisor
	belongs_to :drug

	validates :pharmacy_id, presence: true
	validates :drug_id, presence: true
	validates :date_sale, presence: true
	validates :quantity, numericality: {only_integers:true, greater_than: 0}

	validates :provisor_id, presence: true
	validate  :provisor_validator

	def provisor_validator()
		a = Provisor.all.map{|p| if p.pharmacy_id == pharmacy_id
								p.id
							 end}
		if a.include?(provisor_id) == false
			errors[:provisor_id] << 'работает в другой аптеке'
		end
	end

end