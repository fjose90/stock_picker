require 'rspec'
require_relative 'assignment'

RSpec.describe '#stock_picker' do
  context 'com valores de ações válidos' do
    it 'retorna os melhores dias para comprar e vender para o lucro máximo' do
      expect(stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])).to eq([1, 4])
    end

    it 'funciona quando a melhor compra é no início e a melhor venda é no final' do
      expect(stock_picker([2, 3, 10, 6, 4, 8, 1])).to eq([0, 2])
    end

    it 'retorna os dias corretos quando o melhor lucro está no meio do array' do
      expect(stock_picker([5, 11, 2, 7, 3, 9, 10])).to eq([2, 6])
    end
  end

  context 'com casos extremos' do
    it 'retorna o primeiro par lucrativo quando múltiplos pares têm o mesmo lucro' do
      expect(stock_picker([3, 3, 6, 6, 6, 9, 9, 1])).to eq([0, 5])
    end

    it 'retorna um array vazio quando os preços diminuem continuamente' do
      expect(stock_picker([10, 9, 8, 7, 6, 5, 4])).to eq([])
    end

    it 'retorna um array vazio quando há apenas um preço' do
      expect(stock_picker([10])).to eq([])
    end

    it 'retorna um array vazio quando o array de preços está vazio' do
      expect(stock_picker([])).to eq([])
    end
  end

  context 'com condições de contorno' do
    it 'lida com o caso quando o dia mais alto é antes do dia mais baixo' do
      expect(stock_picker([10, 9, 1, 15, 3, 6])).to eq([2, 3])
    end

    it 'lida com um pico de um dia seguido por uma queda' do
      expect(stock_picker([1, 10, 2, 3, 1])).to eq([0, 1])
    end
  end
end
