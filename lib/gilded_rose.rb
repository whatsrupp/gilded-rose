class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      regular_quality_update(item)
      update_sell_in(item)
      extra_quality_updates(item)
    end
  end

  def is_not_appreciator_item?(item)
    item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
  end

  def isNotLegendary?(item)
    item.name != "Sulfuras, Hand of Ragnaros"
  end

  def is_not_brie?(item)
    item.name != "Aged Brie"
  end

  def is_not_backstage_pass?(item)
    item.name != "Backstage passes to a TAFKAL80ETC concert"
  end

  def is_backstage_pass?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def hasValue?(item)
    item.quality > 0
  end

  def isNotMaxValue?(item)
    item.quality < 50
  end

  def isDepreciatorItemWithValue?(item)
    is_not_appreciator_item?(item) && hasValue?(item) && isNotLegendary?(item)
  end

  def depreciate_item_value(item)
    if hasValue?(item)
      if isNotLegendary?(item)
        item.quality = item.quality - 1
      end
    end
  end

  def appreciate_more_if_backstage_pass(item)
    # Apprecitate Back Stage Pass
    if is_backstage_pass?(item)
      if item.sell_in < 11
        appreciate_item_value(item)
      end
      if item.sell_in < 6
        appreciate_item_value(item)
      end
    end
  end

  def appreciate_item_value(item)
    if isNotMaxValue?(item)
      item.quality = item.quality + 1
    end
  end

  def update_sell_in(item)
    if isNotLegendary?(item)
      item.sell_in = item.sell_in - 1
    end
  end

  def regular_quality_update(item)
    if is_not_appreciator_item?(item)
      depreciate_item_value(item)
    else
      appreciate_item_value(item)
      appreciate_more_if_backstage_pass(item)
    end
  end

  def extra_quality_updates(item)
    if item.sell_in < 0
      if is_not_brie?(item)
        if is_not_backstage_pass?(item)
          if hasValue?(item) and isNotLegendary?(item)
            item.quality = item.quality - 1
          end
        else
          item.quality = item.quality - item.quality
        end
      else
        appreciate_item_value(item)
      end
    end
  end

end
