class NotebookSerializer < ActiveModel::Serializer
ActiveModelSerializers.config.adapter = :json
  attributes  :id,
              :name,
              :color_hex,
              :created_at,
              :updated_at,
              :binder_id,
              :active,
              :children

  def children
    CollectionSerializer.new(object.children, {})
  end
end
