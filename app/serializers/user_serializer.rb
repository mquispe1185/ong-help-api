class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :role, :created_at
end
