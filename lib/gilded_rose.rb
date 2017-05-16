class GildedRose

  def initialize(items)
    @items = items
  end

  def isNotAppreciatorItem?(item)
    item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
  end

  def isNotLegendary?(item)
    item.name != "Sulfuras, Hand of Ragnaros"
  end

  def isNotBrie?(item)
    item.name != "Aged Brie"
  end

  def isNotBackstagePass?(item)
    item.name != "Backstage passes to a TAFKAL80ETC concert"
  end

  def hasValue?(item)
    item.quality > 0
  end

  def isNotMaxValue?(item)
    item.quality < 50
  end

  def update_quality()
    @items.each do |item|
      # THIS WHOLE BLOCK IS QUALITY DROP
      # Regular Item Depreciation
      if isNotAppreciatorItem?(item)
        if hasValue?(item)
          if isNotLegendary?(item)
            item.quality = item.quality - 1
          end
        end
      else
        # Item Appreciates if it's an appreciator
        if isNotMaxValue?(item)
          item.quality = item.quality + 1
          if !isNotBackstagePass?(item)
            # Apprecitate Back Stage Pass
            if item.sell_in < 11
              if isNotMaxValue?(item)
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if isNotMaxValue?(item)
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      # UPDATE SELL IN
      if isNotLegendary?(item)
        item.sell_in = item.sell_in - 1
      end
      # Past sell by date
      if item.sell_in < 0
        if isNotBrie?(item)
          if isNotBackstagePass?(item)
            if hasValue?(item) and isNotLegendary?(item)
              item.quality = item.quality - 1
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if isNotMaxValue?(item)
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end
