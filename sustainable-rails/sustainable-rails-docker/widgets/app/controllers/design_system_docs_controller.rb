class DesignSystemDocsController < ApplicationController
  def index
    @design_system_docs = OpenStruct.new(
          font_sizes: [
            "f-headline",
            "f-subheadline",
            "f1",
            "f2",
            "f3",
            "f4",
            "f5",
            "f6",
          ],
          sizes: [ 1,2,3,4,5 ],
          colors: {
            text: "near-black",
            green: "dark-green",
            red: "dark-red",
            orange: "orange"
      }
    )
  end
end
