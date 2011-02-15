module PersonsHelper
  def fields_for_person_company(comp, &block)
    prefix = comp.new_record? ? 'new' : 'existing'
    fields_for("person[#{prefix}_person_companies_attributes][]", comp, &block)
  end

  def add_person_company_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, "person_companies", :partial => 'person_company', :object => PersonCompany.new
    end
  end

  def person_links(person)
    links = []
    if person.link1_url && person.link1_url.any?
      links << link_to( (person.link1_name.any? ? person.link1_name : person.link1_url), person.link1_url)
    end

    if person.link2_url && person.link2_url.any?
      links << link_to( (person.link2_name.any? ? person.link2_name : person.link2_url), person.link2_url)
    end
    
    if person.link3_url && person.link3_url.any?
      links << link_to( (person.link3_name.any? ? person.link3_name : person.link3_url), person.link3_url)
    end

    if person.link4_url && person.link4_url.any?
      links << link_to( (person.link4_name.any? ? person.link4_name : person.link4_url), person.link4_url)
    end
    links.join('<br />')
  end
end
