Spec::Matchers.define :priklausyti do |tmp, tmp2|
  match do |value|
    value == tmp or value == tmp2
  end
end