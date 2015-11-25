class NoteSerializer < ActiveModel::Serializer
  attributes  :divider_id,
              :hstore,
              :order,
              :active
end

