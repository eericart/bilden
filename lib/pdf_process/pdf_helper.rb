require 'csv'

 def acronym
  pattern = /(\'|\"|\.|\*|\/|\-|\\|\)|\$|\+|\(|\^|\?|\!|\~|\`)/
  self.split.inject(""){|r,s| r+=s.chars.first}.gsub(pattern,"")
end

def genete_clave name
  code=(100..999).to_a.sample
  name.acronym + code.to_s
end