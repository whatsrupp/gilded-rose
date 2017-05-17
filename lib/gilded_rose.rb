require_relative './quality'
class GildedRose

  attr_reader :quality

  def initialize(items, quality: Quality.new)
    @items = items
    @quality = quality
  end

  def update_quality()
    @items.each do |item|
      quality.update(item)
    end
  end

end
