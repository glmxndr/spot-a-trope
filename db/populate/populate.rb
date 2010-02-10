#!/usr/bin/env ruby


# LANGUAGES
l = Language.create
l.name='Français'
l.code='FR'
l.save

l = Language.create
l.name='Anglais'
l.code='EN'
l.save

l = Language.create
l.name='Ελληνικά'
l.code='EL'
l.save

# OPUS
o = Opus.create
o.title="Τὰ εἰς ἑαυτόν"
o.author="Marcus Aurelius"
o.save

# EDITIONS
e = Edition.create
e.language_id=3
e.opus_id=1
e.code="EL_MA_167"
e.title="Τὰ εἰς ἑαυτόν"
e.translator="Original text"
e.year=167
e.country="N/A"
e.city="N/A"
e.save

e = Edition.create
e.language_id=2
e.opus_id=1
e.code="EN_GL_1872"
e.title="The Meditations"
e.translator="Georges Long"
e.year=1872
e.country="England"
e.city="London"
e.save

e = Edition.create
e.language_id=1
e.opus_id=1
e.code="FR_JSBH_1876"
e.title="Pensées de Marc-Aurèle"
e.translator="Jules Barthélémy-Saint-Hilaire"
e.year=1876
e.country="N/A"
e.city="N/A"
e.save

# LOAD DOM
require 'rexml/document'
xml = File.new 'db/populate/taeiseauton.xml'
doc = REXML::Document.new xml

# TOC
doc.elements.each('//toc/tocentry') do |book|

    tocentry = Tocentry.create
    tocentry.opus_id=1
    tocentry.toctype='book'
    tocentry.code=book.attributes['id']
    tocentry.name=book.attributes['name']
    tocentry.save
    puts "Saved TocEntry "+tocentry.name
    
    book.elements.each do |section|
        subtocentry = Tocentry.new
        subtocentry.opus_id=1
        subtocentry.parent_id=tocentry.id
        subtocentry.toctype='section'
        subtocentry.code=section.attributes['id']
        subtocentry.name=section.attributes['name']
        subtocentry.save
        puts "    Saved TocEntry "+subtocentry.name
    end

end

# SECTIONS
doc.elements.each('//section') do |entry|
    tocentry = Tocentry.find_by_code(entry.attributes['reftoc'])
    edition = Edition.find_by_code(entry.attributes['refedition'])
    e = Entry.create
    e.edition_id=edition.id
    e.tocentry_id=tocentry.id
    e.content=entry.elements.to_a('text')[0].text
    e.title=tocentry.name
    e.save
    puts "Saved Entry "+e.title
end

