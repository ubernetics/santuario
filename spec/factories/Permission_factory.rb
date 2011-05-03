# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :permission do |f|
  f.role_id 1
  f.model "MyString"
  f.ability "MyString"
end
