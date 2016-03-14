class AddLongTextToHandlerColumnDelayedJobs < ActiveRecord::Migration
  def change
    change_column :delayed_jobs, :handler, :longtext, :null => false
  end
end
