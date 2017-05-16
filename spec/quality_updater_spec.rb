describe QualityUpdater do
  let (:quality_updater) {described_class.new}

  describe '#set_item' do
    it 'updates the old item with a new item' do
      item = Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
      expect(quality_updater.item).not_to eq(item)
      quality_updater.set_item (item)
      expect(quality_updater.item).to eq(item)
    end
  end
  #
  # describe 'Item Type:' do
  #   describe 'Legendary' do
  #     describe 'Sulfuras' do
  #       it 'does not drop in quality' do
  #         items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
  #         GildedRose.new(items).update_quality()
  #         expect(items[0].quality).to eq 80
  #       end
  #     end
  #   end
  #
  #   describe 'Depreciator' do
  #     context 'within sell by date' do
  #       it 'decreases by 1' do
  #         items = [Item.new(name= 'Chboys Chips',
  #                  sell_in= 20,
  #                  quality= 20)]
  #         GildedRose.new(items).update_quality()
  #         expect(items[0].quality).to eq 19
  #         expect(items[0].sell_in).to eq 19
  #
  #       end
  #       it 'but not past 50' do
  #         items = [Item.new(name= 'Chboys Chips',
  #                  sell_in= 20,
  #                  quality= 0)]
  #         GildedRose.new(items).update_quality()
  #         expect(items[0].quality).to eq 0
  #         expect(items[0].sell_in).to eq 19
  #
  #       end
  #     end
  #     context 'after sell by date' do
  #       it 'decreases by 2' do
  #         items = [Item.new(name= 'Chboys Chips',
  #                  sell_in= 0,
  #                  quality= 20)]
  #         GildedRose.new(items).update_quality()
  #         expect(items[0].quality).to eq 18
  #         expect(items[0].sell_in).to eq -1
  #       end
  #       it 'but not past 50' do
  #         items = [Item.new(name= 'Chboys Chips',
  #                  sell_in= 0,
  #                  quality= 0)]
  #         GildedRose.new(items).update_quality()
  #         expect(items[0].quality).to eq 0
  #         expect(items[0].sell_in).to eq -1
  #
  #       end
  #     end
  #   end
  #
  #   describe 'Appreciator' do
  #     describe 'Backstage Passes' do
  #       context 'before concert' do
  #         context '11 days or more to go' do
  #           it 'quality increases by 1' do
  #             items = [Item.new(name= "Backstage passes to a TAFKAL80ETC concert",
  #                      sell_in= 11,
  #                      quality= 20)]
  #             GildedRose.new(items).update_quality()
  #             expect(items[0].quality).to eq 21
  #             expect(items[0].sell_in).to eq 10
  #
  #           end
  #
  #           it 'but not past 50' do
  #             items = [Item.new(name= "Backstage passes to a TAFKAL80ETC concert",
  #                      sell_in= 11,
  #                      quality= 50)]
  #             GildedRose.new(items).update_quality()
  #             expect(items[0].quality).to eq 50
  #             expect(items[0].sell_in).to eq 10
  #
  #           end
  #         end
  #         context '6-10 days days to go' do
  #           it 'quality increases by 2' do
  #             items = [Item.new(name= "Backstage passes to a TAFKAL80ETC concert",
  #                      sell_in= 6,
  #                      quality= 20)]
  #             GildedRose.new(items).update_quality()
  #             expect(items[0].quality).to eq 22
  #             expect(items[0].sell_in).to eq 5
  #
  #           end
  #           it 'but not past 50' do
  #             items = [Item.new(name= "Backstage passes to a TAFKAL80ETC concert",
  #                      sell_in= 6,
  #                      quality= 49)]
  #             GildedRose.new(items).update_quality()
  #             expect(items[0].quality).to eq 50
  #             expect(items[0].sell_in).to eq 5
  #
  #           end
  #         end
  #         context '5 days left' do
  #           it 'quality increases by 3' do
  #             items = [Item.new(name= "Backstage passes to a TAFKAL80ETC concert",
  #                      sell_in= 5,
  #                      quality= 20)]
  #             GildedRose.new(items).update_quality()
  #             expect(items[0].quality).to eq 23
  #             expect(items[0].sell_in).to eq 4
  #
  #           end
  #           it 'but not past 50' do
  #             items = [Item.new(name= "Backstage passes to a TAFKAL80ETC concert",
  #                      sell_in= 5,
  #                      quality= 48)]
  #             GildedRose.new(items).update_quality()
  #             expect(items[0].quality).to eq 50
  #             expect(items[0].sell_in).to eq 4
  #
  #           end
  #         end
  #       end
  #       context 'after concert' do
  #         it 'drop to 0 quality' do
  #           items = [Item.new(name= "Backstage passes to a TAFKAL80ETC concert",
  #                    sell_in= 0,
  #                    quality= 20)]
  #           GildedRose.new(items).update_quality()
  #           expect(items[0].quality).to eq 0
  #           expect(items[0].sell_in).to eq -1
  #
  #         end
  #       end
  #     end
  #
  #     describe 'Finely Aged Brie' do
  #       it 'increases in quality' do
  #         items = [Item.new(name= "Aged Brie",
  #                  sell_in= 5,
  #                  quality= 20)]
  #         GildedRose.new(items).update_quality()
  #         expect(items[0].quality).to eq 21
  #         expect(items[0].sell_in).to eq 4
  #
  #       end
  #       it 'but not past 50' do
  #         items = [Item.new(name= "Aged Brie",
  #                  sell_in= 5,
  #                  quality= 50)]
  #         GildedRose.new(items).update_quality()
  #         expect(items[0].quality).to eq 50
  #         expect(items[0].sell_in).to eq 4
  #
  #       end
  #     end
  #   end
  #
  #   describe 'Conjured' do
  #     xit 'drops by 2 quality' do
  #       items = [Item.new(name= 'Conjured Chboys Chips',
  #                sell_in= 20,
  #                quality= 20)]
  #       GildedRose.new(items).update_quality()
  #       expect(items[0].quality).to eq 18
  #       expect(items[0].sell_in).to eq 19
  #     end
  #   end
  # end
end
