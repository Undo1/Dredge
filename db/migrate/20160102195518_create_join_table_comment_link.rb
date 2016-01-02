class CreateJoinTableCommentLink < ActiveRecord::Migration
  def change
    create_join_table :comments, :links do |t|
      t.index [:comment_id, :link_id]
      t.index [:link_id, :comment_id]
    end
  end
end
