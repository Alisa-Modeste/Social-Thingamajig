class Post < ActiveRecord::Base
  attr_accessible :author_id, :body, :post_share_ids, :circle_ids

  has_many(
    :links,
    class_name: "Link",
    foreign_key: :post_id,
    primary_key: :id
  )

  has_many(
    :post_shares,
    class_name: "PostShare",
    foreign_key: :post_id,
    primary_key: :id
  )

  has_many(
    :circles,
    through: :post_shares,
    source: :circle
  )

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )

end
