module ProvisorsHelper
	def pharmacy_options(selected)
		options_for_select(Pharmacy.all.map{|p| [p.number, p.id]}, selected)
	end
end
