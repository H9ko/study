module Exercise
  module Arrays
    class << self
      def replace(array)
        max_element = array.reduce(0) do |acc, el|
          acc < el ? el : acc
        end
        array.map do |i|
          i.positive? ? max_element : i
        end
      end

      def search(array, query)
        max_index = array.size - 1
        center_index = max_index / 2

        if array[center_index] == query
          center_index
        elsif array.size == 1 || array[center_index].nil?
          -1
        elsif array[center_index] > query
          search(array[0, center_index], query)
        elsif array[center_index] < query
          next_step = search(array[center_index + 1, max_index], query)
          next_step == -1 ? -1 : center_index + 1 + next_step
        end
      end
    end
  end
end
