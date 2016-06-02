module DrugsHelper
	def show_category(selected)
		if selected.blank? == false
			arr = Hash[*Category.all.map{|c| [c.id, c.name]}.flatten]
			a = Array.new
			n = selected.size
			n.times {|i| a[i] = arr[selected[i]]}
			a.to_s.gsub("[", " ").gsub("]"," ").gsub('" ,',', ').gsub('"', '')
		else
			a = "Без категории"
		end
	end

	def new_category_options(selected)
		options_for_select([["Не добавлять", nil]] | Category.all.map{|p| [p.name, p.id]}, selected)
	end

	def dest_category_options(selected)
		options_for_select([["Не удалять", nil]] | Category.all.map{|p| [p.name, p.id]}, selected)
	end
end
