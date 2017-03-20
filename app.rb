class SimpleLoggerServer < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  helpers do
    def require_application!
      return if authorize_application
      halt 401, "Not authorized\n"
    end

    def authorize_application
      auth =  Rack::Auth::Basic::Request.new(request.env)
      if auth.provided? && auth.basic? && auth.credentials
        @application = Application.where(name: auth.credentials[0], key: auth.credentials[1]).first
      else
        false
      end
    end
  end

  post '/log' do
    content_type :json
    require_application!

    logs = JSON.parse(params['logs'])
    if logs && logs.is_a?(Array)
      logs.each do |log|
        type = log.delete('type').to_sym
        case type
        when :request
          @application.request_logs.create(RequestLog.sanitize_params(log))
        when :error
          @application.error_logs.create(ErrorLog.sanitize_params(log))
        end
      end
      { success: true }.to_json
    else
      puts "not an array: #{params}"
      { error: 'logs must be an array' }.to_json
    end
  end
end
