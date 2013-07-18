class OptIn < ActiveRecord::Base
  belongs_to :permission_type
  belongs_to :channel
  belongs_to :company

  validates :email, :mobile, :first_name, :last_name, presence: true
  validates_associated :permission_type, :channel, :company

  def deactivate
    self.active = false
    self.save
  end
end
