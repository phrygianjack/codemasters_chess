require 'rails_helper'

RSpec.describe Knight, type: :model do
  describe '#create' do
    it 'creates a knight in the database' do
      knight = FactoryGirl.create(:knight)
      expect(knight.type == 'Knight').to eq(true)
    end
  end

  describe '#valid_move?' do
    it 'returns true if the move is 2 up and 1 to the right' do
      knight = FactoryGirl.create(:knight)
      expect(knight.valid_move?(to_x: 5, to_y: 6)).to eq(true)
    end

    it 'returns true if the move is 1 up and 2 to the right' do
      knight = FactoryGirl.create(:knight)
      expect(knight.valid_move?(to_x: 6, to_y: 5)).to eq(true)
    end

    it 'returns true if the move is 1 down and 2 to the right' do
      knight = FactoryGirl.create(:knight)
      expect(knight.valid_move?(to_x: 6, to_y: 3)).to eq(true)
    end

    it 'returns true if the move is 2 down and 1 to the right' do
      knight = FactoryGirl.create(:knight)
      expect(knight.valid_move?(to_x: 5, to_y: 2)).to eq(true)
    end

    it 'returns true if the move is 2 down and 1 to the left' do
      knight = FactoryGirl.create(:knight)
      expect(knight.valid_move?(to_x: 3, to_y: 2)).to eq(true)
    end

    it 'returns true if the move is 1 down and 2 to the left' do
      knight = FactoryGirl.create(:knight)
      expect(knight.valid_move?(to_x: 2, to_y: 3)).to eq(true)
    end

    it 'returns true if the move is 1 up and 2 to the left' do
      knight = FactoryGirl.create(:knight)
      expect(knight.valid_move?(to_x: 2, to_y: 5)).to eq(true)
    end

    it 'returns true if the move is 2 up and 1 to the left' do
      knight = FactoryGirl.create(:knight)
      expect(knight.valid_move?(to_x: 3, to_y: 6)).to eq(true)
    end

    it 'returns false if the move is not L-shaped, covering a total of 3 squares' do
      knight = FactoryGirl.create(:knight)
      expect(knight.valid_move?(to_x: 1, to_y: 1)).to eq('Knight may move only in an L shape, a total of 3 squares. Try again.')
    end
  end
end
