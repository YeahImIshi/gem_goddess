ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :role

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :role, as: :select, collection: AdminUser.roles.keys.map { |role| [role.titleize, role] }
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: AdminUser.roles.keys.map { |role| [role.titleize, role] }
    end
    f.actions
  end

end
