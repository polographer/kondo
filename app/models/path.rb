class Path < ApplicationRecord
    has_many :pictures, :dependent => :destroy
    def scan
        extensions = ["jpg", "jpeg","png","raw","dng","orf","cr2"]
        extensions = extensions + extensions.map(&:upcase)

        extensions.each do | ext |
            Dir["#{self.location}/**/*."+ext].each do |full_file_name|
                item = self.pictures.find_or_create_by(full_path: full_file_name)
                item.filename = File.basename(full_file_name)
                item.will_organize = self.organize
                item.will_research = true
                ext = File.extname(full_file_name)
                item.extension = ext.gsub!(/\W/,'')
                if item.extension.nil?
                    item.extension = extension
                end
                #item.extension
                #item.raw = is_raw_image?(item.extension)
                item.filesystem_date = File.ctime(full_file_name)
                item.size = File.size(full_file_name)      
                item.save          
            end
        end
    end
end
