
class Cuboid

  def initialize(origin, length, width, height)
    @origin = origin
    @length = length
    @width = width
    @height = height

    if length < 0 || width < 0 || height < 0
      raise "Please enter positive number"
    end
  end

  def move_to!(x, y, z)
    @origin[:x] = x
    @origin[:y] = y
    @origin[:z] = z
    return @origin
  end

  def vertices
    @vertices_array = []
    @vertices_array << [min_x, min_y, min_z]
    @vertices_array << [max_x, min_y, min_z]
    @vertices_array << [min_x, max_y, min_z]
    @vertices_array << [min_x, min_y, max_z]
    @vertices_array << [max_x, max_y, min_z]
    @vertices_array << [min_x, max_y, max_z]
    @vertices_array << [max_x, min_y, max_z]
    @vertices_array << [max_x, max_y, max_z]
    return @vertices_array
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
   return false if self.max_x < other.min_x
   return false if self.min_x > other.max_x
   return false if self.max_y < other.min_y
   return false if self.min_y > other.max_y
   return false if self.max_z < other.min_z
   return false if self.min_z > other.max_z
   true
  end

  protected

  def min_x
    @origin[:x]
  end

  def max_x
    @origin[:x] + @length
  end

  def min_y
    @origin[:y]
  end

  def max_y
    @origin[:y] + @height
  end

  def min_z
    @origin[:z]
  end

  def max_z
    @origin[:z] + @width
  end

  #END public methods that should be your starting point
end
