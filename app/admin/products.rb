ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

  permit_params :title, :price, :description, :category_id, :tags, :image_url

  form do |f|
    f.inputs do
      f.input :title
      f.input :price
      f.input :description
      f.input :category_id, as: :select, collection: Category.all
      f.input :tags
      f.input :image_url
    end
    f.actions
  end

  controller do
    def scoped_collection
      super.page(params[:page]).per(10)
    end
  end

end
