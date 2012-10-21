class CreateMicroblogs < ActiveRecord::Migration
  def self.up
    create_table :microblogs do |t|

      t.column :project_id, :integer

      t.column :user_id, :integer

      t.column :body, :text

      t.column :created_at, :datetime

      t.column :updated_at, :datetime

    end
  end

  def self.down
    drop_table :microblogs
  end
end
