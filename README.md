# Colormap

Utility for mapping values to colors. Think temperature maps, density maps, etc.

## Usage

    waypoints = [
      { value: 0.0, color: "#000000" }, #Black
      { value: 10.0, color: "#430843" },
      { value: 20.0, color: "#6b0c6b" },
      { value: 30.0, color: "#821081" }, #Purple
      { value: 40.0, color: "#07148c" },
      { value: 50.0, color: "#1679fc" }, #Blue
      { value: 60.0, color: "#2bf2fe" },
      { value: 70.0, color: "#108210" }, #Green
      { value: 80.0, color: "#f2ff38" }, #Yellow
      { value: 90.0, color: "#fe9a27" }, #Orange
      { value: 100.0, color: "#ff5013" },
      { value: 110.0, color: "#fe2727" },
      { value: 120.0, color: "#d52121" },
      { value: 130.0, color: "#b21b1b" }  #Death
    ]
    
    colormap = Colormap::Colormap.new( waypoints )
    
    temp_f = 87.3
    background_color = colormap.color(value:temp_f).to_rgb