class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      perform_initial_quality_updates(item)
      #perform_initial_quality_updates(item)
      update_sell_in(item)
      perform_extra_quality_updates(item)
    end
  end

  def is_not_appreciator_item?(item)
    item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
  end

  def is_not_legendary?(item)
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

  def has_value?(item)
    item.quality > 0
  end

  def is_not_max_value?(item)
    item.quality < 50
  end

  def is_depreciator_item_with_value?(item)
    is_not_appreciator_item?(item) && has_value?(item) && is_not_legendary?(item)
  end

  def depreciate_item_value(item)
    if has_value?(item)
      if is_not_legendary?(item)
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
    if is_not_max_value?(item)
      item.quality = item.quality + 1
    end
  end

  def update_sell_in(item)
    if is_not_legendary?(item)
      item.sell_in = item.sell_in - 1
    end
  end

  def perform_initial_quality_updates(item)
    if is_not_appreciator_item?(item)
      depreciate_item_value(item)
    else
      appreciate_item_value(item)
      appreciate_more_if_backstage_pass(item)
    end
  end

  def perform_extra_quality_updates(item)
    if item.sell_in < 0
      if is_not_brie?(item)
        if is_not_backstage_pass?(item)
          if has_value?(item) and is_not_legendary?(item)
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
