FactoryBot.define do
  factory :item do
    item_name      {'gggg'}
    description    {'ffff'}
    category_id    {'3'}
    condition_id   {'5'}
    fee_id         {'2'}
    region_id      {'3'}
    delivery_id    {'2'}
    price          {'1111'}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image_png.png'), filename: 'test_image_png.png')
    end
  end
end
