class DividerSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :description,
              :created_at,
              :parent_id,
              :parent_type,
              :active
  has_many :children, serializer: DividerSerializer
  has_many :notes, serializer: NoteSerializer
end
