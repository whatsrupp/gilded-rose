describe GildedRose do

  describe "#update_quality" do

    describe 'quality' do
      describe 'constraints' do
        it 'can never be negative'
        it 'can never be more than 50'
      end
    end

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
        end
        context 'after sell by date' do
          it 'decreases by 2' do
            items = [Item.new(name= 'Chboys Chips',
                     sell_in= 0,
                     quality= 20)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 18
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
            end
            context '6-10 days days to go' do
              it 'quality increases by 2' do
                items = [Item.new(name= "Backstage passes to a TAFKAL80ETC concert",
                         sell_in= 6,
                         quality= 20)]
                GildedRose.new(items).update_quality()
                expect(items[0].quality).to eq 22
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
            end
          end
          context 'after concert' do
            it 'drop to 0 quality'
          end
        end

        describe 'Finely Aged Brie' do
          it 'increases in quality'
          it 'but not past 50'
        end
      end

      describe 'Conjured' do
        it 'drops by 2 quality'
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
