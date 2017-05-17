describe Quality do
  let (:quality) {described_class.new}

  describe '#set_item' do
    it 'updates the old item with a new item' do
      item = Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
      expect(quality.item).not_to eq(item)
      quality.set_item (item)
      expect(quality.item).to eq(item)
    end
  end

  describe 'Item Type:' do
    describe 'Legendary' do
      describe 'Sulfuras' do
        it 'does not drop in quality' do
          item = Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
          quality.set_item(item)
          quality.update
          expect(item.quality).to eq 80
        end
      end
    end

    describe 'Depreciator' do
      context 'within sell by date' do
        it 'decreases by 1' do
          item = Item.new('Chboys Chips',
                    20,
                    20)
          quality.set_item(item)
          quality.update
          expect(item.quality).to eq 19

        end
        it 'but not past 50' do
          item = Item.new( 'Chboys Chips',
                    20,
                    0)
          quality.set_item(item)
          quality.update
          expect(item.quality).to eq 0

        end
      end
      context 'after sell by date' do
        it 'decreases by 2' do
          item = Item.new( 'Chboys Chips',
                    0,
                    20)
          quality.set_item(item)
          quality.update
          expect(item.quality).to eq 18
        end
        it 'but not past 50' do
          item = Item.new( 'Chboys Chips',
                    0,
                    0)
          quality.set_item(item)
          quality.update
          expect(item.quality).to eq 0

        end
      end
    end

    describe 'Appreciator' do
      describe 'Backstage Passes' do
        context 'before concert' do
          context '11 days or more to go' do
            it 'quality increases by 1' do
              item = Item.new( "Backstage passes to a TAFKAL80ETC concert",
                        11,
                        20)
              quality.set_item(item)
              quality.update
              expect(item.quality).to eq 21

            end

            it 'but not past 50' do
              item = Item.new( "Backstage passes to a TAFKAL80ETC concert",
                        11,
                        50)
              quality.set_item(item)
              quality.update
              expect(item.quality).to eq 50

            end
          end
          context '6-10 days days to go' do
            it 'quality increases by 2' do
              item = Item.new( "Backstage passes to a TAFKAL80ETC concert",
                        6,
                        20)
              quality.set_item(item)
              quality.update
              expect(item.quality).to eq 22

            end
            it 'but not past 50' do
              item = Item.new( "Backstage passes to a TAFKAL80ETC concert",
                        6,
                        49)
              quality.set_item(item)
              quality.update
              expect(item.quality).to eq 50

            end
          end
          context '5 days left' do
            it 'quality increases by 3' do
              item = Item.new( "Backstage passes to a TAFKAL80ETC concert",
                        5,
                        20)
              quality.set_item(item)
              quality.update
              expect(item.quality).to eq 23

            end
            it 'but not past 50' do
              item = Item.new( "Backstage passes to a TAFKAL80ETC concert",
                        5,
                        48)
              quality.set_item(item)
              quality.update
              expect(item.quality).to eq 50

            end
          end
        end
        context 'after concert' do
          it 'drop to 0 quality' do
            item = Item.new( "Backstage passes to a TAFKAL80ETC concert",
                      0,
                      20)
            quality.set_item(item)
            quality.update
            expect(item.quality).to eq 0

          end
        end
      end

      describe 'Finely Aged Brie' do
        it 'increases in quality' do
          item = Item.new( "Aged Brie",
                    5,
                    20)
          quality.set_item(item)
          quality.update
          expect(item.quality).to eq 21

        end
        it 'but not past 50' do
          item = Item.new( "Aged Brie",
                    5,
                    50)
          quality.set_item(item)
          quality.update
          expect(item.quality).to eq 50

        end
      end
    end

    describe 'Conjured' do
      xit 'drops by 2 quality' do
        item = Item.new( 'Conjured Chboys Chips',
                  20,
                  20)
        quality.set_item(item)
        quality.update
        expect(item.quality).to eq 18
      end
    end
  end
end
