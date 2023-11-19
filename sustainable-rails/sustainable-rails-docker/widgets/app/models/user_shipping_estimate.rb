class UserShippingEstimate
  include ActiveModel::Model
  attr_accessor :widget_name,
                :widget_user_facing_id,
                :shipping_zone,
                :destination_post_code

  def persisted?
    true
  end

  def to_key
    [ self.widget_user_facing_id,
      self.destination_post_code ]
  end
end
