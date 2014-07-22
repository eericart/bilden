require_relative 'pdf_helper.rb'

class PdfProcess::Process
  attr_accessor  :career_data
  attr_accessor  :attachment_pdf
  attr_accessor  :career_name

  def initialize (attachment)
    @attachment_pdf = attachment
    @career_data = []
  end

  def process_data
    convert_to_csv
    (1..2).each do |index|
      csv_content=CSV.open("lib/pdf_process/csv/#{index}.csv", "r").map{|content| content}
      csv_content.first.delete("")
      @career_name = csv_content.delete(csv_content.first).join.squeeze(" ").strip.split("(") if index == 1
      @career_data += clean_data(csv_content)
    end
    convert_to_record
    delete_processed

  end


  def convert_to_csv
    (1..2).each do |index|
      system "jruby /opt/jruby/bin/tabula #{attachment_pdf.attachment.current_path} -p #{index} -o lib/pdf_process/csv/#{index}.csv"
    end
  end
  def delete_processed
    attachment_pdf.remove_attachment
    attachment_pdf.delete
  end

  def clean_data (csv_data)
    csv_data.each {|a| a.delete("")}
    csv_data.keep_if {|a|  (a[0].to_i == 0 and a.size >1) or a[0].include? "TRIMESTRE" }
    csv_data.delete_at(0)
    csv_data.each  do |a|
      next if a[2].nil?
      data = a[2].split
      if data.size > 1
        a.delete_at(2)
        a.insert(2,data[0])
        a.insert(3,data.select { |d| d != data.first}.join(" "))
      end
    end
    csv_data.each {|a| a.insert(0,gen_clave(a[0])) if a.size == 3}
    csv_data.each {|a| a.insert(3,"none") if a.size == 4}
    csv_data.map{|a| a.map {|data|  data.squeeze(" ").strip}}
  end

  def convert_to_record
    trimester_number=0
    @career_name[1].gsub!(/(\'|\"|\.|\*|\/|\-|\\|\)|\$|\+|\(|\^|\?|\!|\~|\`)/,"").downcase!
    career=Career.find_by(code: "#{career_name[1]}") || Career.create(name: "#{career_name[0]}", code:"#{career_name[1]}" )
    p career
    career.career_subjects.all.each{|cs| cs.delete}
    career_data.each do |data|
      if data.size == 1 and data[0].include? "TRIMESTRE"
        trimester_number+=1
      else
        subject=Subject.find_by(code: "#{data[0]}") || Subject.create(code: "#{data[0]}",name: "#{data[1]}",credits: data[2].to_i)
        cs=CareerSubject.new
        cs.career=career
        cs.subject=subject
        cs.credits_prerequisite=data[4].to_i
        cs.trimester_number=trimester_number
        cs.subject_prerequisite=Subject.where(code:  data[3].split)
        cs.save
      end
    end
  end
end