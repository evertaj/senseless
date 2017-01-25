ActiveAdmin.register Post do

  controller do
    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    end
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :body, :title, :hidden, :banner_image_url
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
    column :title
    column :user
    column :body do |post|
      post.body.split(" ").each_with_object("") {|x,ob| break ob unless (ob.length + " ".length + x.length <= 200);ob << (" " + x)}.strip
    end
    column :created_at
    column :banner_image_url
    column :hidden
    actions
  end

end
