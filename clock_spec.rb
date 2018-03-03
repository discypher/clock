require_relative 'clock'

RSpec.describe Clock do
  context 'with valid input' do
    it 'returns degrees less than 180' do
      degrees = Clock.new('8:15 AM').to_degrees
      expect(degrees).to be < 180
    end

    it 'correctly calculates 3:00 AM' do
      degrees = Clock.new('3:00 AM').to_degrees
      expect(degrees).to eq 90
    end

    it 'correctly calculates 9:00 PM' do
      degrees = Clock.new('09:00 PM').to_degrees
      expect(degrees).to eq 90
    end

    it 'correctly calculates 12:00 AM' do
      degrees = Clock.new('12:00 AM').to_degrees
      expect(degrees).to eq 0
    end

    it 'correctly calculates 12:00 PM' do
      degrees = Clock.new('12:00 PM').to_degrees
      expect(degrees).to eq 0
    end

    it 'correctly calculates 12:30 PM' do
      degrees = Clock.new('12:30 PM').to_degrees
      expect(degrees).to eq 165
    end

    it 'correctly calculates 6:00 AM' do
      degrees = Clock.new('6:00 AM').to_degrees
      expect(degrees).to eq 180
    end

    context 'after noon' do
      it 'is handled correctly' do
        degrees = Clock.new('10:00 PM').to_degrees
        expect(degrees).to eq 60
      end
    end

    context 'before noon' do
      it 'is handled correctly' do
        degrees = Clock.new('10:00 AM').to_degrees
        expect(degrees).to eq 60
      end
    end

    context 'values over 180' do
      it 'returns the smaller angle' do
        degrees = Clock.new('09:05 PM').to_degrees
        expect(degrees).to be < 180
      end

      it 'handles hour angles greater than 180' do
        degrees = Clock.new('8:15 AM').to_degrees
        expect(degrees).to eq 157
      end

      it 'returns degrees less than 180' do
        degrees = Clock.new('06:01 PM').to_degrees
        expect(degrees).to be < 180
      end
    end
  end

  context 'with invalid input' do
    it 'raises an ArgumentError' do
      expect { Clock.new('dogs') }.to raise_error(ArgumentError)
    end
  end
end
