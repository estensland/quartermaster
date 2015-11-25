class DividerSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :description,
              :created_at,
              :parent_id,
              :parent_type,
              :active
end
