module Auth
  HMAC_SECRET = Rails.application.secrets.secret_key_base

  def auth_create(user)
    JWT.encode({user_id: user.id}, HMAC_SECRET)
  end

  def auth_check
    begin
      raise "Authorization header missing" unless request.headers['Authorization'].present?
      token = JWT.decode(request.headers['Authorization'].split(' ').last, HMAC_SECRET)[0]
      @user ||= User.find(token["user_id"])
    rescue Exception => e
      json_response({message: e.message}, :unauthorized)
    end
  end
end
