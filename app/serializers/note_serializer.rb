class NoteSerializer < ActiveModel::Serializer
  attributes  :id,
              :divider_id,
              :body,
              :hstore,
              :order,
              :active
end

