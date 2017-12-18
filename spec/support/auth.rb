module Auth
  def api_sign_in(user)
    request.headers.merge!({
      'X-User-Email' => user.email,
      'X-User-Token' => user.authentication_token
    })
  end
end
