module ApplicationHelper

	def nonblank_fields_out_of_list resource, fields
		resource.select {|field, val| fields.member?(field) && !val.blank}
	end

end
