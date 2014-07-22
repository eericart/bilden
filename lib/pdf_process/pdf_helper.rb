require 'csv'

class String
  def siglas
     pattern = /(\'|\"|\.|\*|\/|\-|\\|\)|\$|\+|\(|\^|\?|\!|\~|\`)/
    self.split.inject(""){|r,s| r+=s.chars.first}.gsub(pattern,"")
  end
end



def gen_clave name
  code=(100..999).to_a.sample
  name.siglas + code.to_s
end