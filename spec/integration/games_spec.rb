require 'spec_helper'

RSpec.describe "Game's integration" do
  describe "#check" do
    subject(:check) { TicTacToe.check(board) }

    context 'when the board is incomplete' do
      let(:board) do
        [
          [0, 2, 0],
          [0, 1, 0],
          [0, 0, 1]
        ]
      end

      it { is_expected.to eq(-1) }
    end

    context 'when X wons the game' do
      context 'by filling a line' do
        let(:board) do
          [
            [0, 2, 0],
            [1, 1, 1],
            [0, 0, 1]
          ]
        end

        it { is_expected.to eq(1) }
      end

      context 'by filling a row' do
        let(:board) do
          [
            [1, 2, 0],
            [1, 2, 1],
            [1, 0, 1]
          ]
        end

        it { is_expected.to eq(1) }
      end

      context 'by filling the right cross' do
        let(:board) do
          [
            [1, 2, 0],
            [0, 1, 1],
            [0, 0, 1]
          ]
        end

        it { is_expected.to eq(1) }
      end

      context 'by filling the left cross' do
        let(:board) do
          [
            [1, 2, 1],
            [0, 1, 0],
            [1, 0, 1]
          ]
        end

        it { is_expected.to eq(1) }
      end
    end

    context 'when O wons the game' do
      context 'by filling a line' do
        let(:board) do
          [
            [0, 1, 0],
            [2, 2, 2],
            [0, 0, 1]
          ]
        end

        it { is_expected.to eq(2) }
      end

      context 'by filling a row' do
        let(:board) do
          [
            [2, 1, 0],
            [2, 1, 2],
            [2, 0, 2]
          ]
        end

        it { is_expected.to eq(2) }
      end

      context 'by filling the right cross' do
        let(:board) do
          [
            [2, 1, 0],
            [0, 2, 1],
            [0, 0, 2]
          ]
        end

        it { is_expected.to eq(2) }
      end

      context 'by filling the left cross' do
        let(:board) do
          [
            [1, 1, 2],
            [0, 2, 0],
            [2, 0, 1]
          ]
        end

        it { is_expected.to eq(2) }
      end
    end

    context 'when it is a cats game' do
      let(:board) do
        [
          [1, 2, 1],
          [1, 1, 2],
          [2, 1, 2]
        ]
      end

      it { is_expected.to eq(0) }
    end
  end
end
