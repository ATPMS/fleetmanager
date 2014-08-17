ActiveAdmin.register Vessel do
  permit_params :name, :code, :reference_number, :user_id, :user

  index do
    selectable_column
    column :name
    column :code
    column :reference_number
    column :user
    column :created_at
    actions
  end

  filter :user
  filter :name
  filter :code
  filter :reference_number

  form do |f|
    f.inputs "Vessel Details" do
      f.input :user
      f.input :name
      f.input :code
      f.input :reference_number
    end
    f.actions
  end

end

