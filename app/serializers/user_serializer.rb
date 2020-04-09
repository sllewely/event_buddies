class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  
  attributes :id, :first_name, :last_name, :profile_thumbnail_url
  attribute :email, if: :is_current_user?

  def profile_thumbnail_url
    variant = object.profile_pic.variant(resize: "100x100")
    return rails_representation_url(variant, only_path: true)
  end

  def is_current_user?
    current_user && object.id == current_user.id
  end
end
