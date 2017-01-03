require_relative '../routee'
require_relative '../services/routee_authentication_service'
require_relative '../utils/refresh_token_result'

# Created by Ing. Tatioti Mbogning Raoul(tatiotir@gmail.com, tatioti.raoul@gmail.com)

class ApplicationController

  protected
    def authenticate
      unless Routee.appSecret || Routee.appId
        return RefreshTokenResult.new(nil, '{"error": SDK Secret is null}', :bad_request)
      end

      if Routee.appId && Routee.appSecret then
        if Routee.token then
          tokenValue = String.new(Routee.token).split(':')[0]
          tokenExpirationDate = String.new(Routee.token).split(':')[1].to_i
          currentDate = DateTime.now.to_time.to_i
          if tokenExpirationDate > currentDate
            return RefreshTokenResult.new(tokenValue, nil, :ok)
          else
            tokenResult = refreshAccessToken
            return tokenResult
          end
        else
          tokenResult = refreshAccessToken
          return tokenResult
        end
      else
        return RefreshTokenResult.new(nil, '{"error": Please set your app Id and your app secret from Routee}', :bad_request)
      end
    end

  private
    def refreshAccessToken
      result = RouteeAuthenticationService.getInstance.authenticateApplication(Routee.appId, Routee.appSecret)

      if result.jsonBody['error'] then
        return RefreshTokenResult.new(nil, result.jsonBody, result.statusCode)
      end

      if result.jsonBody['access_token'] then
        expirationDate = DateTime.now.to_time.to_i + Integer(result.jsonBody['expires_in'])
        Routee.updateToken = result.jsonBody['access_token'] + ':' + expirationDate.to_s
        return RefreshTokenResult.new(result.jsonBody['access_token'], '', result.statusCode)
      else
        return RefreshTokenResult.new(nil, result.jsonBody, result.statusCode)
      end
    end
end
