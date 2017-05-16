# require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    describe 'quality' do
      describe 'constraints' do
        it 'can never be negative'
        it 'can never be more than 50'
      end
    end

    describe 'Item Type:' do
      describe 'Legendary' do
        describe 'Sulfuras' do
          it 'does not drop in quality'
          it 'has a quality of 80'
        end
      end

      describe 'Depreciator' do
        context 'within sell by date' do
          it 'decreases by 1'
        end
        context 'after sell by date' do
          it 'decreases by 2'
        end

      end

      describe 'Appreciator' do
        describe 'Backstage Passes' do
          context 'before concert' do
            context '11 days or more to go' do
              it 'quality increases by 1'
            end
            context '6-10 days days to go' do
              it 'quality increases by 2'
            end
            context '5 days left' do
              it 'quality increases by 3'
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
