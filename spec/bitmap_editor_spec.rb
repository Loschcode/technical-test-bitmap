
require_relative '../app/bitmap_editor.rb'

RSpec.describe BitmapEditor do

  context "generate a map" do

    it "a 5x6 map is generated" do

      expect(BitmapEditor.new.send(:generate_map, "5", "6")).to match_array([["0"]*5]*6)

    end

  end

end