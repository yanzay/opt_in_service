['one-time', 'permanent'].each do |type|
  PermissionType.create(name: type)
end

['sms', 'email', 'sms+email'].each do |channel|
  Channel.create(name: channel)
end

['Apple', 'Microsoft', 'Google', '.PROMO'].each do |company|
  Company.create(name: company)
end
