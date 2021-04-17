class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :tag
  has_one :column
  has_one :user
end
