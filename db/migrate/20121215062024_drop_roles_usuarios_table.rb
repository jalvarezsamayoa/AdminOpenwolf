class DropRolesUsuariosTable < ActiveRecord::Migration
  def up
    drop_table :roles_usuarios
  end

  def down
    create_table "roles_usuarios", :id => false, :force => true do |t|
      t.integer  "usuario_id"
      t.integer  "role_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "roles_usuarios", ["role_id"], :name => "index_roles_usuarios_on_role_id"
    add_index "roles_usuarios", ["usuario_id"], :name => "index_roles_usuarios_on_usuario_id"
  end
end
