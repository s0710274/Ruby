
Spec::Matchers.define :daugiau_uz_leistina do ||
  match do |value|    
    value > 70
  end
end

Spec::Matchers.define :priklausyti_intervalui do |pabaiga|
  match do |value|
    value >= 0 and value <= pabaiga
  end
end