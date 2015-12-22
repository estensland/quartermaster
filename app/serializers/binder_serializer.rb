class BinderSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :color_hex,
              :created_at,
              :updated_at,
              :active
  has_many :notebooks, serializer: NotebookSerializer
end
