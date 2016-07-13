require 'test_helper'

module Contentdm
  describe CompoundItem do
    describe "when no collection or id have been provided" do
      it 'returns an array of hashes' do
        VCR.use_cassette("invalid_compound_request") do
          compound = CompoundItem.new(base_url: 'https://server16022.contentdm.oclc.org/dmwebservices/index.php')
          compound.metadata.must_equal({'id' => '/0'})
        end
      end
    end

    describe "when a valid compound record has been requested" do
      it 'produces a single ruby hash representing the item' do
        VCR.use_cassette("valid_compound_request") do
          compound = CompoundItem.new(base_url: 'https://server16022.contentdm.oclc.org/dmwebservices/index.php', collection: 'p16022coll39', id: 446)
          compound.metadata.must_equal({"title"=>"Catalogue for the second annual exhibition of the work of Minneapolis artists, November 4-30, 1916, at the Minneapolis Institute of Arts (Minneapolis, Minnesota) / Artists' League of Minneapolis; Minneapolis School of Art Alumni Association; Attic Club; Twin City Keramic Club; Minneapolis Society of Fine Arts; Minneapolis Institute of Arts", "photog"=>"Artists' League of Minneapolis; Minneapolis School of Art Alumni Association", "contri"=>"Attic Club (Minneapolis, Minnesota); Twin City Keramic Club; Minneapolis Society of Fine Arts; Minneapolis Institute of Arts", "descri"=>"Variant title: Work of Minneapolis artists, November 4-30, 1916. Title from cover. \"The exhibition is under the auspices of the Artists' League of Minneapolis, the Alumni Association of the Minneapolis School of Art, the Attic Club of Minneapolis, the Twin City Keramic Club, and the Minneapolis Society of Fine Arts.\"--Page 2. Includes a list of the jury on admission which also served as a Committee on Arrangements. 8 unnumbered pages.", "dat"=>"1916?", "publia"=>"Minneapolis Institute of Arts (Minneapolis, Minnesota)", "dimens"=>"16", "genera"=>"The Arts", "type"=>"Document", "physic"=>"Exhibition Catalogs", "specif"=>"Museum exhibits", "subjec"=>"Minneapolis Institute of Arts -- Exhibitions; Minneapolis Institute of Arts -- History; Minneapolis Institute of Arts -- Exhibitions -- 1916; Art, American -- 20th century -- Exhibitions; Artists -- Minnesota -- Minneapolis -- Exhibitions; Art -- Competitions --Minnesota -- Exhibitions; Art -- Minnesota -- Minneapolis -- Exhibitions; Minnesota -- In art -- Exhibitions", "city"=>"Minneapolis", "distri"=>{}, "county"=>"Hennepin", "state"=>"Minnesota", "countr"=>"United States", "geogra"=>{}, "litora"=>{}, "princi"=>{}, "geogrb"=>{}, "langua"=>"English", "parent"=>"Minneapolis Institute of Arts, Archives", "contra"=>"Minneapolis Institute of Arts", "contac"=>"Minneapolis Institute of Arts, Archives, Art Research & Reference Library, 2400 Third Avenue South, Minneapolis, Minnesota 55404 http://www.artsmia.org", "righta"=>"Use is governed by U.S. and international copyright law. It is the responsibility of researchers to obtain permission from all copyright holders before publication.", "identi"=>"36765", "resour"=>{}, "projec"=>"Minnesota Reflections 2013-14", "fiscal"=>"Funding provided to the Minnesota Digital Library through the Minnesota Arts and Cultural Heritage Fund, a component of the Minnesota Clean Water, Land and Legacy constitutional amendment, ratified by Minnesota voters in 2008.", "publis"=>{}, "date"=>{}, "format"=>{}, "digspe"=>{}, "digspa"=>{}, "digspb"=>{}, "digspc"=>{}, "digspd"=>{}, "digspf"=>{}, "digspg"=>{}, "digsph"=>{}, "digspi"=>{}, "digspj"=>{}, "digspk"=>{}, "transc"=>{}, "transl"=>{}, "fullrs"=>{}, "find"=>"447.cpd", "dmaccess"=>{}, "dmimage"=>{}, "dmcreated"=>"2014-09-11", "dmmodified"=>"2014-09-11", "dmoclcno"=>{}, "dmrecord"=>"446", "restrictionCode"=>"1", "cdmfilesize"=>"1180", "cdmfilesizeformatted"=>"0.00 MB", "cdmprintpdf"=>"0", "cdmhasocr"=>"0", "cdmisnewspaper"=>"0", "page"=>[{"pagetitle"=>"Title page", "pagefile"=>"439.jp2", "pageptr"=>"438"}, {"pagetitle"=>"Catalogue, Paintings 1-4", "pagefile"=>"440.jp2", "pageptr"=>"439"}, {"pagetitle"=>"Paintings 5-25", "pagefile"=>"441.jp2", "pageptr"=>"440"}, {"pagetitle"=>"Paintings 26-45", "pagefile"=>"442.jp2", "pageptr"=>"441"}, {"pagetitle"=>"Paintings 46-60, Sculpture 61-64", "pagefile"=>"443.jp2", "pageptr"=>"442"}, {"pagetitle"=>"Prints and drawings 65-83, Commercial art 84-85", "pagefile"=>"444.jp2", "pageptr"=>"443"}, {"pagetitle"=>"Commercial art 86-95, Applied art 96-101", "pagefile"=>"445.jp2", "pageptr"=>"444"}, {"pagetitle"=>"Applied art 102-122", "pagefile"=>"446.jp2", "pageptr"=>"445"}], 'id' =>"p16022coll39/446"})
        end
      end
    end
  end
end