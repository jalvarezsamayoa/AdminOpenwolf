class Role < ActiveRecord::Base  
  has_and_belongs_to_many :usuarios, :join_table => :usuarios_roles
  belongs_to :resource, :polymorphic => true
  
  scopify
end

# == Schema Information
#
# Table name: roles
#
#  id                :integer          not null, primary key
#  name              :string(40)
#  authorizable_type :string(40)
#  authorizable_id   :integer
#  created_at        :datetime
#  updated_at        :datetime
#  resource_id       :integer
#  resource_type     :string(255)
#

