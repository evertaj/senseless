ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :username, :email, :city, :bio, :sign_in_count, :remember_created_at, :last_sign_in_at, :created_at, :updated_at
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  index do
    column :id
    column :username
    column :email
    column :city
    column :bio
    column :created_at
    column :last_sign_in_at
    column :avatars do |img|
      img.avatars[0].url
    end
    actions
  end

  form html: { multipart: true } do |f|
    f.inputs "Resource Details" do
      f.input :username
      f.input :email
      f.input :city
      f.input :bio
    end
    f.actions
  end

end
