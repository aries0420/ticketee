class Permission < ActiveRecord::Base
  # attr_accessible :action, :thing_id, :thing_type, :user_id
  attr_accessible :user, :action, :thing
  belongs_to :user
  belongs_to :thing, :polymorphic => true
end
