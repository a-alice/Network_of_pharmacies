module IsalesHelper
	def pharmacy_options(selected)
		options_for_select(Pharmacy.all.map{|p| [p.number, p.id]}, selected)
	end

	def drug_options(selected)
		options_for_select(Drug.all.map{|d| [d.name, d.id]}, selected)
	end

	def provisor_options(selected)
		options_for_select(Provisor.all.map{|p| [p.surname + " " + p.name + " " + p.fathername + " (" + p.passport.to_s + ")", p.id]}, selected)
	end

	def show_pharmacy(selected)
		Hash[*Pharmacy.all.map{|d| [d.id, d.number]}.flatten][selected]
	end

end
