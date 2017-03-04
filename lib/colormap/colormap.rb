require 'color'

module Colormap
  
  include ::Color
  
  class Colormap
  
    attr_accessor :waypoints
  
    def initialize( waypoints )
      self.waypoints = waypoints
    end
  
    def color( value: value )
      value = value.to_f
      
      if value < self.waypoints[0][:value]
        value = self.waypoints[0][:value]
      elsif value > self.waypoints.last[:value]
        value = self.waypoints.last[:value]
      end
      
      p = 0
      n = 0
    
      self.waypoints.each_with_index do |w,i|
        p = i
      
        if value >= self.waypoints[i][:value].to_f && value <= self.waypoints[i+1][:value].to_f
          n = i + 1
          break
        end
      end
      
      Rails.logger.info "value: #{value}"
      Rails.logger.info "p: #{p}"
      Rails.logger.info "n: #{n}"
    
      prevColor = ::Color::RGB.from_html( self.waypoints[p][:color] )
      nextColor = ::Color::RGB.from_html( self.waypoints[n][:color] )
    
      distance = (value - self.waypoints[p][:value].to_f) / ( self.waypoints[n][:value].to_f - self.waypoints[p][:value].to_f )
    
      Rails.logger.info "distance: #{distance}"
    
      self.color_between( color_1:prevColor, color_2:nextColor, distance:distance )
    end
  
    def color_between( color_1: color_1, color_2: color_2, distance: distance )
      
      color_1 = color_1.to_hsl
      color_2 = color_2.to_hsl
          
      h1 = color_1.hue; s1 = color_1.saturation; b1 = color_1.luminosity;
      h2 = color_2.hue; s2 = color_2.saturation; b2 = color_2.luminosity;
    
      Rails.logger.info "#{h1} #{s1} #{b1}"
      Rails.logger.info "#{h2} #{s2} #{b2}"
    
      if h2 == 1.0
        h2 = 0.0
      end
    
      if h1 == 1.0
        h1 = 0.0
      end
    
      h = h1 - ((h1 - h2) * ( distance )) #Color 2.hue should be higher because hue goes down as temp goes up
      s = color_1.saturation + ((color_2.saturation - color_1.saturation).abs * ( distance ))
      b = color_1.luminosity + ((color_2.luminosity - color_1.luminosity).abs * ( distance ))
    
      return ::Color::HSL.new( h, s, b )
    end
  
  end
end