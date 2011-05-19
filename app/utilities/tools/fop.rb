module Tools
  class Fop

    def self.resolve_file(tempfiles, name, source)
      file = source
      
      case source.class.name
      when "Pathname"
        file = File.new(source.to_s)
      when "File"
        file = source
      when "String"
        file = Tempfile.new(name)
        file << source
        file.flush

        tempfiles << file
      else 
        file = Tempfile.new(name)
        tempfiles << file
      end
      
      file
    end
    
    def self.render_pdf(options)
      raise "block missing" unless block_given?
      options ||= {}
      
      tempfiles = []
      pdf = Fop.resolve_file(tempfiles, 'pdf_otuput.pdf', options[:pdf])
      xml = Fop.resolve_file(tempfiles, 'xml_source.xml', options[:xml])
      xsl = Fop.resolve_file(tempfiles, 'xsl_source.xml', options[:xsl])

      success = Fop.execute(xml.path, xsl.path, pdf.path)
      errors = $?
      
      begin
        yield(pdf.path, success, errors)
      ensure
        # dont leave garbage in the filesystem
        tempfiles.each do |file|
          file.close
          file.unlink
        end
      end
    end
    
    def self.execute(xml, xsl, pdf)
      command = "fop -xml #{xml} -xsl #{xsl} -pdf #{pdf}"
      #Rails.logger.debug command
      Kernel.system(command)
    end
  end
end