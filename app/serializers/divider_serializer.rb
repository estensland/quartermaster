class DividerSerializer < ActiveModel::Serializer
  ActiveModelSerializers.config.adapter = :json
  attributes  :id,
              :name,
              :description,
              :created_at,
              :parent_id,
              :parent_type,
              :display_order,
              :active,
              :notes,
              :children
  def notes
    CollectionSerializer.new(object.notes, {})
  end

  def children
    CollectionSerializer.new(object.children, {})
  end
end
