class MoveRolesInfo < ActiveRecord::Migration
  def up
  	execute <<-SQL
  		insert into usuarios_roles select usuario_id, role_id from roles_usuarios
  	SQL
  end

  def down
  	execute <<-SQL
  		insert into roles_usuarios select usuario_id, role_id from usuarios_roles
  	SQL
  end
end
