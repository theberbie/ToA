require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do
  subject(:cuboid) { Cuboid.new({x:1, y: 2,z: 3}, 4,5,6) }
  subject(:neg_cuboid) { Cuboid.new({x:-1, y:-1, z:-1}, -1, 1, -1) }

  describe "initialize" do
    it 'returns an error if input is less than 0'do
      expect{ neg_cuboid }.to raise_error
    end
  end

  describe "move_to" do
    it "changes the origin in the simple happy case" do
      expect(cuboid.move_to!(1,2,3)).to eq({x:1, y:2, z:3})
    end
  end

  describe "intersects?" do
    it "returns false when the cuboids don't intersect" do
      current = Cuboid.new({x:1, y:1, z:1}, 2,2,2)
      other = Cuboid.new({x:4, y:4, z:4},2,4,4)
      expect(current.intersects?(other)).to be false
    end

    it "returns true when the cuboids intersect" do
      current = Cuboid.new({x:1, y:1, z:1}, 1,1,1)
      other = Cuboid.new({x:1, y:1, z:1}, 1, 1,1)
      expect(current.intersects?(other)).to be true
      end
  end

  describe "vertices" do
    it "returns all the verticies" do
      expect(cuboid.vertices).to eq([
        [1,2,3],
        [5,2,3],
        [1,8,3],
        [1,2,8],
        [5,8,3],
        [1,8,8],
        [5,2,8],
        [5,8,8]
       ])
    end

    it "returns 8 vertices" do
      expect(cuboid.vertices.length).to eq(8)
    end
  end
end
