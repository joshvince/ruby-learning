require 'roy_osherove/kata_01/string_calculator'

RSpec.describe RoyOsherove::Kata01::StringCalculator, '#add' do
  # include RoyOsherove::Kata01::StringCalculator
  let(:calculator) { described_class.new }
  context 'task one' do
    it 'returns 0 for an empty string' do
      expect(calculator.add("")).to eq 0
    end

    it 'returns a number given only one number' do
      expect(calculator.add("1")).to eq 1
    end

    it 'returns the sum of two numbers provided' do
      expect(calculator.add("1,2")).to eq 3
    end

    it 'returns the sum of two very high numbers' do
      expect(calculator.add("500,500")).to eq 1000
    end
  end

  context 'task two' do
    it 'handles three numbers' do
      expect(calculator.add("1,2,3")).to eq 6
    end

    it 'handles lots and lots of numbers' do
      expect(calculator.add("5,5,5,5,5,5,5,5,5,5,5,5")).to eq 60
    end
  end

  context 'task three' do
    it 'handles newlines between numbers' do
      expect(calculator.add("1\n2")).to eq 3
    end

    it 'handles newlines and commas' do
      expect(calculator.add("1\n2,3")).to eq 6
    end

    it 'handles long strings separated by newlines' do
      expect(calculator.add("1\n2\n3\n")).to eq 6
    end
  end

  context 'task four' do
    it 'handles different delimiters' do
      expect(calculator.add("//;\n1;2")).to eq 3
    end

    it 'handles long strings with a random delimiter' do
      expect(calculator.add("//[\n1[2[3[4[5")).to eq 15
    end
  end

  context 'task five' do
    it 'throws errors when a negative number is parsed' do
      expect { calculator.add("-1.2") }.to raise_error RuntimeError, /negatives not allowed/
    end

    it 'displays the offending negative numbers in the error message' do
      expect { calculator.add("-1,2") }.to raise_error RuntimeError, /-1/
    end

    it 'displays all offending negative numbers in the error' do
      expect { calculator.add("-1,2,-3") }.to raise_error RuntimeError, /[-1]|[-3]/
    end
  end

  context 'task six' do
    it 'ignores numbers larger than 1000' do
      expect(calculator.add("2,1001")).to eq 2
    end
  end

  context 'task seven' do
    it 'handles delimiters of varying length' do
      expect(calculator.add("//[***]\n1***2***3")).to eq 6
    end

    it 'handles delimiters of varying length' do
      expect(calculator.add("//[;;;]\n1;;;2;;;3")).to eq 6
    end
  end

  context 'task eight' do
    it 'allows multiple delimeters' do
      expect(calculator.add("//[*][%]\n1*2%3")).to eq 6
    end
  end

  context 'task nine' do
    it 'allows multiple multi char delimiters' do
      expect(calculator.add("//[**][%%]\n1**2%%3")).to eq 6
    end
  end 
end