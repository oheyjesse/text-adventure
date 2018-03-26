require_relative 'spec_helper.rb'

# require_relative '../lib/adventure/world'

RSpec.describe Adventure::World do

  let(:world) { described_class.new(5) }

  it 'can initialize a world with a size of 5' do
    expect(world).to be_a(Adventure::World)
    expect(world.size).to eq(5)
  end

  it 'can generate worldmap array of arrays @ the right size' do
    expect(world.worldmap.length).to eq(5)
    expect(world.worldmap.last.length).to eq(5)
  end

  it 'draws the worldmap array, filling it with locations' do
    expect(world.worldmap.flatten).to all(be_a(Adventure::Location))
  end

end

RSpec.describe Adventure::Location do

  let(:location) { described_class.new([2,2]) }

  it 'can initialize a location at coordinates 2,2' do
    expect(location).to be_a(Adventure::Location)
  end

  it 'is named a DESCRIPTOR + a LOCATION_INDEX name' do

  end

  it ''
end
