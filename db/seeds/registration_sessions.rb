if defined?(User)
  User.all.each do |user|
    if user.plugins.where(name: 'registration_sessions').blank?
      user.plugins.create(name: 'registration_sessions',
                          position: (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

registration_sessions = ( (y=Time.now.year)..(y+3) ).map{|year|
  RegistrationSession.create RegistrationSession.default_dates(year)
}.collect{|r| r}
