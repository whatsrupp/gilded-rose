describe GildedRose do

  describe "#update_quality" do

    describe 'Item Type:' do
      describe 'Legendary' do
        describe 'Sulfuras' do
          it 'does not drop in quality' do
            items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 80
          end
        end
      end

      describe 'Depreciator' do
        context 'within sell by date' do
          it 'decreases by 1' do
            items = [Item.new(name= 'Chboys Chips',
                     sell_in= 20,
                     quality= 20)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 19
          end
          it 'but not past 50' do
            items = [Item.new(name= 'Chboys Chips',
                     sell_in= 20,
                     quality= 0)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 0
          end
        end
        context 'after sell by date' do
          it 'decreases by 2' do
            items = [Item.new(name= 'Chboys Chips',
                     sell_in= 0,
                     quality= 20)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 18
          end
          it 'but not past 50' do
            items = [Item.new(name= 'Chboys Chips',
                     sell_in= 0,
                     quality= 0)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 0
          end
        end
      end

      describe 'Appreciator' do
        describe 'Backstage Passes' do
          context 'before concert' do
            context '11 days or more to go' do
              it 'quality increases by 1' do
                items = [Item.new(name= "Backstage passes to a TAFKAL80ETC concert",
                         sell_in= 11,
                         quality= 20)]
                GildedRose.new(items).update_quality()
                expect(items[0].quality).to eq 21
              end

              it 'but not past 50' do
                items = [Item.new(name= "Backstage passes to a TAFKAL80ETC concert",
                         sell_in= 5,
                         quality= 50)]
                GildedRose.new(items).update_quality()
                expect(items[0].quality).to eq 50
              end
            end
            context '6-10 days days to go' do
              it 'quality increases by 2' do
                items = [Item.new(name= "Backstage passes to a TAFKAL80ETC concert",
                         sell_in= 6,
                         quality= 20)]
                GildedRose.new(items).update_quality()
                expect(items[0].quality).to eq 22
              end
              it 'but not past 50' do
                items = [Item.new(name= "Backstage passes to a TAFKAL80ETC concert",
                         sell_in= 5,
                         quality= 49)]
                GildedRose.new(items).update_quality()
                expect(items[0].quality).to eq 50
              end
            end
            context '5 days left' do
              it 'quality increases by 3' do
                items = [Item.new(name= "Backstage passes to a TAFKAL80ETC concert",
                         sell_in= 5,
                         quality= 20)]
                GildedRose.new(items).update_quality()
                expect(items[0].quality).to eq 23
              end
              it 'but not past 50' do
                items = [Item.new(name= "Backstage passes to a TAFKAL80ETC concert",
                         sell_in= 5,
                         quality= 48)]
                GildedRose.new(items).update_quality()
                expect(items[0].quality).to eq 50
              end
            end
          end
          context 'after concert' do
            it 'drop to 0 quality' do
              items = [Item.new(name= "Backstage passes to a TAFKAL80ETC concert",
                       sell_in= 0,
                       quality= 20)]
              GildedRose.new(items).update_quality()
              expect(items[0].quality).to eq 0
            end
          end
        end

        describe 'Finely Aged Brie' do
          it 'increases in quality' do
            items = [Item.new(name= "Aged Brie",
                     sell_in= 5,
                     quality= 20)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 21
            expect(items[0].sell_in).to eq 4

          end
          it 'but not past 50' do
            items = [Item.new(name= "Aged Brie",
                     sell_in= 5,
                     quality= 50)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 50
            expect(items[0].sell_in).to eq 4

          end
        end
      end

      describe 'Conjured' do
        xit 'drops by 2 quality' do
          items = [Item.new(name= 'Conjured Chboys Chips',
                   sell_in= 20,
                   quality= 20)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 18
          expect(items[0].sell_in).to eq 19
        end
      end
    end
  end

  describe '#update_sell_in' do
    describe 'Legendaries' do
      it 'doesnt age'
    end
    describe 'Other items' do
      it 'decrease by 1'
    end
  end

end
