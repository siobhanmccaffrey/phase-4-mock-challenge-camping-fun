class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :difficulty
  # 
  # belongs_to :camper
end
