describe GildedRose do

  describe '#update_quality' do
    it 'makes a call to the quality updater class' do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
               Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
      gilded_rose = GildedRose.new(items)
      expect(gilded_rose.quality).to receive(:update).twice
      gilded_rose.update_quality
    end
  end
end
