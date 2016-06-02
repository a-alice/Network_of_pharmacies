module CategoriesHelper
	def show_drug(selected)
		if selected.blank? == false
			arr = Hash[*Drug.all.map{|d| [d.id, d.name]}.flatten]
			a = Array.new
			n = selected.size
			n.times {|i| a[i] = arr[selected[i]]}
			a.to_s.gsub("[", " ").gsub("]"," ").gsub('" ,',', ').gsub('"', '')
		else
			a = "Нет лекарств"
		end
	end

	def new_drug_options(selected)
		options_for_select([["Не добавлять", nil]] | Drug.all.map{|d| [d.name, d.id]}, selected)
	end

	def dest_drug_options(selected)
		options_for_select([["Не удалять", nil]] | Drug.all.map{|d| [d.name, d.id]}, selected)
	end
end
