class ProvinceSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at

  attribute :created_at do 
  	object.created_at.strftime "%d-%m-%Y" 
  end
end
