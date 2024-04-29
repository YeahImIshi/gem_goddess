ActiveAdmin.register About do
  permit_params :content

  form do |f|
    f.inputs do
      f.input :content, as: :text_area
    end
    f.actions
  end
end