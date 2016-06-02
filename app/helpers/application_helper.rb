module ApplicationHelper
	def russify_boolean(value)
		return 'Да' if value
		return 'Нет'
	end
end
