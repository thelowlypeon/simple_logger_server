class RequestLog < ActiveRecord::Base
  belongs_to :application

  def self.sanitize_params(data)
    unixtime = Time.at(data.delete('unixtime')) rescue nil
    timestamp = data.delete('timestamp')
    Hash[allowed_params.map {|k| [k, data.delete(k.to_s)] }].merge({
      timestamp: unixtime || timestamp || Time.now,
      custom_fields: data
    })
  end

  def self.allowed_params
    [:method,
     :path,
     :query,
     :status,
     :remote_ip,
     :user_agent,
     :language,
     :referrer,
     :request_uri]
  end
end
