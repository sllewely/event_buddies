class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name
  attribute :email, if: :is_current_user?

  def is_current_user?
    current_user && object.id == current_user.id
  end
end
