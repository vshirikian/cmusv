class CreateDeliverables < ActiveRecord::Migration
  def self.up
    create_table :deliverables do |t|
      t.string :name
      t.integer :version
      t.string :deliverable_file_name
      t.string :deliverable_content_type
      t.date :submission_date
      t.string :comments
      t.string :task_name

      t.timestamps
    end
  end

  def self.down
    drop_table :deliverables
  end
end
