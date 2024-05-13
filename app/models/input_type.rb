class InputType < ApplicationRecord
  # 🚅 add concerns above.

  # 🚅 add attribute accessors above.

  belongs_to :project
  # 🚅 add belongs_to associations above.

  # 🚅 add has_many associations above.

  has_one :team, through: :project
  has_rich_text :description
  # 🚅 add has_one associations above.

  # 🚅 add scopes above.

  validates :name, presence: true
  # 🚅 add validations above.

  # 🚅 add callbacks above.

  # 🚅 add delegations above.

  def not_in_use?
    InputItem.where(type: self).count.zero?
  end
  # 🚅 add methods above.
end
