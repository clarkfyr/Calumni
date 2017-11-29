module CalumnisHelper
  def ishomepage
    current_page?('/')
  end
	# def redirect_to_back_or_default(default = root_url)
	#   if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
	#     redirect_to :back
	#   else
	#     redirect_to default
	#   end
	# end
end
