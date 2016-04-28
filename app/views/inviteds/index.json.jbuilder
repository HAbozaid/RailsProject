json.array!(@inviteds) do |invited|
  json.extract! invited, :id, :order_id, :user_id
  json.url invited_url(invited, format: :json)
end
