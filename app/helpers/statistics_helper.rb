module StatisticsHelper
	def show_number(selected)
		Hash[*Pharmacy.all.map{|d| [d.id, d.number]}.flatten][selected]
	end
end
