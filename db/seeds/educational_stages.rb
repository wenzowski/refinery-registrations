if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'educational_stages').blank?
      user.plugins.create(:name => 'educational_stages',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

educational_stage = EducationalStage.create([
  {
    name: 'Kindergarten to Grade 5',
    reduced_registration_amount: '30',
    regular_registration_amount: '60',
  },
  {
    name: 'Grade 6 to Grade 7',
    reduced_registration_amount: '45',
    regular_registration_amount: '80',
  },
  {
    name: 'Grade 8 to Grade 9',
    reduced_registration_amount: '55',
    regular_registration_amount: '100',
  }
])
