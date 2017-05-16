class QualityUpdater
  public
  attr_reader :item

  def initializer()
    @item  = nil
  end

  def set_item(new_item)
    self.item = new_item
  end

  def update
    perform_initial_quality_updates
    update_sell_in
    perform_extra_quality_updates
  end

  def is_not_appreciator_item?
    item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
  end

  def is_not_legendary?
    item.name != "Sulfuras, Hand of Ragnaros"
  end

  def is_not_brie?
    item.name != "Aged Brie"
  end

  def is_not_backstage_pass?
    item.name != "Backstage passes to a TAFKAL80ETC concert"
  end

  def is_backstage_pass?
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def has_value?
    item.quality > 0
  end

  def is_not_max_value?
    item.quality < 50
  end

  def is_depreciator_item_with_value?
    is_not_appreciator_item? && has_value? && is_not_legendary?
  end

  def depreciate_item_value
    if has_value?
      if is_not_legendary?
        item.quality = item.quality - 1
      end
    end
  end

  def appreciate_more_if_backstage_pass
    if is_backstage_pass?
      if item.sell_in < 11
        appreciate_item_value
      end
      if item.sell_in < 6
        appreciate_item_value
      end
    end
  end

  def appreciate_item_value
    if is_not_max_value?
      item.quality = item.quality + 1
    end
  end

  def update_sell_in
    if is_not_legendary?
      item.sell_in = item.sell_in - 1
    end
  end

  def perform_initial_quality_updates
    if is_not_appreciator_item?
      depreciate_item_value
    else
      appreciate_item_value
      appreciate_more_if_backstage_pass
    end
  end

  def perform_extra_quality_updates
    if item.sell_in < 0
      if is_not_brie?
        if is_not_backstage_pass?
          depreciate_item_value
        else
          item.quality = item.quality - item.quality
        end
      else
        appreciate_item_value
      end
    end
  end

  private
  attr_writer :item
end
