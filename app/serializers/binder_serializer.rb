class BinderSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :description,
              :color_hex,
              :created_at,
              :updated_at,
              :shelf_id,
              :active,
              :notebooks

  def notebooks
    CollectionSerializer.new(object.notebooks, {})
  end
end
