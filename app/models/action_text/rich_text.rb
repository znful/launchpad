class ActionText::RichText < ActionText::Record
  def self.ransackable_attributes(auth_object = nil)
    [ "body" ]
  end
end
