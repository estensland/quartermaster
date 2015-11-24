class NotebookSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :color_hex,
              :created_at,
              :update_at,
              :active
end
