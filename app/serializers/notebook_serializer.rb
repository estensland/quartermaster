class NotebookSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :color_hex,
              :created_at,
              :updated_at,
              :active
end