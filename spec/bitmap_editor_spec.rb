
require_relative '../app/bitmap_editor.rb'

RSpec.describe BitmapEditor do

  context "generate a map" do

    it "generates a 5x6 map" do

      expect(BitmapEditor.new.send(:generate_map, "5", "6")).to match_array([["0"]*5]*6)

    end

  end

  context "generate and display a map" do

    editor = BitmapEditor.new
    editor.send(:generate_map, "5", "6")

    it "displays the correct map" do

      expect(editor.send(:display_map)).to eq(("0"*5+"\n")*6)

    end

  end

end