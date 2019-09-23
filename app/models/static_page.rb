class StaticPage

  # to access the validation method
  include ActiveModel::Model

  attr_accessor :user_id

  validates :user_id, presence: true

  def save
    if valid?
      true
    else
      false
    end
  end

end