class RolifyCreateRoles < ActiveRecord::Migration
  def change
    change_table(:roles) do |t|
      t.references :resource, :polymorphic => true
    end

    create_table(:usuarios_roles, :id => false) do |t|
      t.references :usuario
      t.references :role
    end

    add_index(:roles, :name) rescue nil
    add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:usuarios_roles, [ :usuario_id, :role_id ])
  end
end
