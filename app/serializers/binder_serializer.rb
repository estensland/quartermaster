class BinderSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :description,
              :color_hex,
              :created_at,
              :updated_at,
              :shelf_id,
              :active
  has_many :notebooks, serializer: NotebookSerializer
end
