class Circle < ActiveRecord::Base
  attr_accessible :member_ids, :name
  validates :name, :uniqueness => {:scope => :owner_id}

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id
  )

  has_many(
    :circle_memberships,
    class_name: "CircleMembership",
    foreign_key: :circle_id,
    primary_key: :id
  )

  has_many(
    :members,
    through: :circle_memberships,
    source: :member
  )

  has_many(
    :post_shares,
    class_name: "PostShare",
    foreign_key: :circle_id,
    primary_key: :id
  )


end
