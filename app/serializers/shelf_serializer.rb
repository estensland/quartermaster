class ShelfSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :description,
              :created_at,
              :updated_at,
              :active
  has_many :binders, serializer: BinderSerializer
end
