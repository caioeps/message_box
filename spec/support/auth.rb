module Auth
  def api_sign_in(user)
    user.update_attribute(:authentication_token, 'token')

    request.headers.merge!({
      'X-User-Email' => user.email,
      'X-User-Token' => user.authentication_token
    })
  end
end
