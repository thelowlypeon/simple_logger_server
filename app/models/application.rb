class Application < ActiveRecord::Base
  before_create :generate_key
  validates :name,
    presence: true,
    format: {
      with: /[a-z0-9_\.\(\):, -]/i,
      message: 'simple characters only'
    }
  has_many :request_logs
  has_many :error_logs

  def generate_key
    self.key = SecureRandom.hex
  end
end
