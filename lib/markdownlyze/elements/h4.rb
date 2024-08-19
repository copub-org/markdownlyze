module Markdownlyze
  module Elements
    class H4
      def initialize(line:, index:, lines:)
        @line = line
        @index = index
        @lines = lines
      end

      def value
        @line.gsub(/^#### /, '')
      end
    end
  end
end
