class CircleMembership < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to(
    :circle,
    class_name: "Circle",
    foreign_key: :circle_id,
    primary_key: :id
  )

  belongs_to(
    :member,
    class_name: "User",
    foreign_key: :circle_member_id,
    primary_key: :id
  )

end
