class Path < ApplicationRecord
    has_many :pictures
    def scan
        extensions = ["jpg", "jpeg","png","raw","dng","orf"]
        extensions.each do | ext |
            Dir["#{self.location}/**/*."+ext].each do |full_file_name|
                item = self.pictures.find_or_create_by(full_path: full_file_name)

                #puts file
                item.filename = File.basename(full_file_name)
                #item.
                item.will_organize = self.organize
                item.will_research = true
                item.extension = File.extname(full_file_name)
                item.filesystem_date = File.ctime(full_file_name)
                item.size = File.size(full_file_name)      
                item.save          
            end
        end
    end
end
