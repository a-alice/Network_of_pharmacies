module IavailsHelper
	def pharmacy_options(selected)
		options_for_select(Pharmacy.all.map{|p| [p.number, p.id]}, selected)
	end

	def drug_options(selected)
		options_for_select(Drug.all.map{|d| [d.name, d.id]}, selected)
	end
end
