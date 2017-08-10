require 'base64'
require 'json'

module VisClient
  class Adapter

    def initialize(opts = nil)
      @config = VisClient.config
      @config.config.import(opts) if opts
    end

    def send_request(params, resource)
      logger.debug 'Entrou send_request ----------------------------------------------------'
      logger.debug params
      logger.debug resource
      if config.deliver_notifications
        a = faraday_request params, resource
        logger.debug a
      else
        config.logger.info "Notifications are disabled, if you wanna see some notifications," \
          "please modify the configuration."
      end
    end


    private

    attr_reader :config

    def faraday_request(params, resource)
      resp = connection.post(resource) do |c|
        c.body = params
      end

      handle_response(resp.status, resp.body)
    end

    def connection
      headers = {'Authorization' => Base64::encode64("core-team:JOjLeRjcK"),
                 'Content-Type' => 'application/json'}
      @faraday ||= Faraday.new(:url => config.endpoint,
                               :headers => headers)
    end

    def handle_response(status_code, body)
      case status_code
      when 200
        return true
      when 201
        return true
      when 202
        return true
      when 400
        raise BadRequest, "Bad request"
      when 401
        raise UnauthorizedAccess, "Not Authorized to access vis server."
      when 404
        raise ResourceNotFound, "Resource not found: app_id is probably invalid"
      when 409
        return true
      else
        raise ConnectionError, "Unknown error (status code #{status_code}): #{body}"
      end
    end

  end
end
