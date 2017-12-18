module JsonResponse
  def json_response
    JSON.parse response
  end
end
