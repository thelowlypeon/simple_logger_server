class ErrorLog < ActiveRecord::Base
  belongs_to :application

  def self.sanitize_params(data)
    unixtime = Time.at(data.delete('unixtime')) rescue nil
    timestamp = data.delete('timestamp')
    Hash[allowed_params.map {|k| [k, data.delete(k.to_s)] }].merge({
      timestamp: unixtime || timestamp || Time.now
    })
  end

  def self.allowed_params
    [:error, :message, :backtrace]
  end
end
