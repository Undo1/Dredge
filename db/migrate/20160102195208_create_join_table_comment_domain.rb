class CreateJoinTableCommentDomain < ActiveRecord::Migration
  def change
    create_join_table :comments, :domains do |t|
      t.index [:comment_id, :domain_id]
      t.index [:domain_id, :comment_id]
    end
  end
end
