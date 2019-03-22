class Menu < ApplicationRecord
  has_many :menu_actions , inverse_of: :menu
end
