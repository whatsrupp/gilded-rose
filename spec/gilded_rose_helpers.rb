# require_relative '../lib/gilded_rose'
# require_relative '../lib/item'

def create_item(name: 'Cheddar of Ctuhulu',
                sell_in: 20,
                quality: 40)

  Item.new(name= name,
           sell_in= sell_in,
           quality= quality)
end

def update_quality(item: create_item, days: 1)
  list_of_items = [item]
  gilded_rose = GildedRose.new(list_of_items)
  days.times do
    gilded_rose.update_quality
  end
  gilded_rose
end
