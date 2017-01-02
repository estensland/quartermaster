class NotebookSerializer < ActiveModel::Serializer
ActiveModelSerializers.config.adapter = :json
  attributes  :id,
              :name,
              :color_hex,
              :created_at,
              :updated_at,
              :binder_id,
              :active
  has_many :children, serializer: DividerSerializer
end
