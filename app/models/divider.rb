class Divider < ActiveRecord::Base
  belongs_to :notebook
  belongs_to :parent
  has_many :notes
end