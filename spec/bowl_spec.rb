require 'spec_helper'
require 'bowl'

def bowl_game(*rolls)
  b = Bowl.new
  rolls.each {|roll| b.roll roll}
  b
end

describe 'bowling' do
  it 'rolling a 3 scores 3' do
    expect(bowl_game(* %w(3).map(&:to_i)).score).to eq 3
  end

  it 'rolling a 3 and then a three scores a 6' do
    expect(bowl_game(* %w(3 3).map(&:to_i)).score).to eq 6
  end

  it 'roll 5,5,3 scores a 16' do
    expect(bowl_game(* %w(5 5 3).map(&:to_i)).score).to eq 16
  end

  it 'roll 5,5, score is 10' do
    expect(bowl_game(* %w(5 5).map(&:to_i)).score).to eq 10
  end

  it 'roll 5,5,3,3 scores a 16' do
    expect(bowl_game(* %w(5 5 3 3).map(&:to_i)).score).to eq 19 
  end 


  it 'roll 5,5,3,3 scores a 16' do
    expect(bowl_game(* %w(5 5 3 3 0 0 5 5 3 3 0 0).map(&:to_i)).score).to eq 38 
  end

  it 'roll 10,5,4 scores a 28' do
    expect(bowl_game(* %w(10 5 4).map(&:to_i)).score).to eq 28 
  end

  it 'roll 10,5,4 scores a 28' do
    expect(bowl_game(* %w(10 10 5 4).map(&:to_i)).score).to eq (25+19+9) 
  end
  
  it 'roll 10 scores a 10' do
    expect(bowl_game(* %w(10).map(&:to_i)).score).to eq (10) 
  end
  
  it 'roll 10, 10, 10 scores a 60' do
    expect(bowl_game(* %w(10 10 10).map(&:to_i)).score).to eq (60) 
  end
end

