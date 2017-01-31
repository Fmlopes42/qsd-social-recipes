FactoryGirl.define do
  factory :recipe do
    name 'Miojo'
    cuisine
    food_type
    serves 1
    prep_time 3
    difficulty 1
    ingredients '1 pct de miojo'
    prep_steps 'Ferva água, coloque o miojo e aguarde 3 minutos.'
    user
  end
end
