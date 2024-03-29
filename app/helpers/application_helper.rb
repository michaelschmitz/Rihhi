# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def set_focus_to_id(id)     #Call this with %= set_focus_to_id 'form_field_label' %>
   tag = "<script type=\"text/javascript\">  window.onload = function () {var input = document.getElementById (\'" + id.to_s + "\'); input.focus ();;};</script>"
   tag
  end
 
  def country_list(extended = nil) 
    @countries = {
      t("country.a") => "-------",
      t("country.Afghanistan") => "country.Afghanistan", 
      t("country.Aland_Islands") => "country.Aland_Islands",
      t("country.Albania") => "country.Albania",
      t("country.Algeria") => "country.Algeria",
      t("country.American_Samoa") => "country.American_Samoa",
      t("country.Andorra") => "country.Andorra" ,
      t("country.Angola") => "country.Angola",
      t("country.Anguilla") => "country.Anguilla",    
      t("country.Antigua_and_Barbuda") => "country.Antigua_and_Barbuda", 
      t("country.Argentina") => "country.Argentina",
      t("country.Armenia") => "country.Armenia",
      t("country.Aruba") => "country.Aruba",
      t("country.Australia") => "country.Australia",
      t("country.Austria") => "country.Austria",
      t("country.Azerbaijan") => "country.Azerbaijan",
      t("country.Bahamas") => "country.Bahamas", 
      t("country.Bahrain") => "country.Bahrain",
      t("country.Bangladesh") => "country.Bangladesh",
      t("country.Barbados") => "country.Barbados" ,
      t("country.Belarus") => "country.Belarus",
      t("country.Belgium") => "country.Belgium" ,
      t("country.Belize") => "country.Belize",
      t("country.Benin") => "country.Benin",
      t("country.Bermuda") => "country.Bermuda",
      t("country.Bhutan") => "country.Bhutan",
      t("country.Bolivia") => "country.Bolivia", 
      t("country.Bosnia_and_Herzegowina") => "country.Bosnia_and_Herzegowina",
      t("country.Botswana") => "country.Botswana",
      t("country.Bouvet_Island") => "country.Bouvet_Island",
      t("country.Brazil") => "country.Brazil",
      t("country.British_Indian_Ocean_Territory") => "country.British_Indian_Ocean_Territory",
      t("country.Brunei_Darussalam") => "country.Brunei_Darussalam" ,
      t("country.Bulgaria") => "country.Bulgaria",
      t("country.Burkina_Faso") => "country.Burkina_Faso",
      t("country.Burundi_Cambodia") => "country.Burundi_Cambodia",
      t("country.Cameroon") => "country.Cameroon",
      t("country.Canada") => "country.Canada",
      t("country.Cape_Verde") => "country.Cape_Verde",
      t("country.Cayman_Islands") => "country.Cayman_Islands" ,
      t("country.Central_African_Republic") => "country.Central_African_Republic",
      t("country.Chad") => "country.Chad" ,
      t("country.Chile") => "country.Chile" ,
      t("country.China") => "country.China",
      t("country.Christmas_Island") =>  "country.Christmas_Island",
      t("country.Cocos_(Keeling)_Islands") => "country.Cocos_(Keeling)_Islands",
      t("country.Colombia") => "country.Colombia",
      t("country.Comoros") => "country.Comoros" ,
      t("country.Congo") =>  "country.Congo" ,
      t("country.Congo_the_Democratic_Republic_of_the") => "country.Congo_the_Democratic_Republic_of_the",
      t("country.Cook_Islands") => "country.Cook_Islands",
      t("country.Costa_Rica") => "country.Costa_Rica",
      t("country.Cote_d_Ivoire") => "country.Cote_d_Ivoire",
      t("country.Croatia") => "country.Croatia",
      t("country.Cuba") => "country.Cuba",
      t("country.Cyprus") => "country.Cyprus",
      t("country.Czech_Republic") => "country.Czech_Republic",
      t("country.Denmark") => "country.Denmark",
      t("country.Djibouti") => "country.Djibouti",
      t("country.Dominica") => "country.Dominica",
      t("country.Dominican_Republic") => "country.Dominican_Republic",
      t("country.Ecuador") => "country.Ecuador",
      t("country.Egypt") => "country.Egypt",
      t("country.El_Salvador") => "country.El_Salvador",
      t("country.Equatorial_Guinea") => "country.Equatorial_Guinea" ,
      t("country.Eritrea") => "country.Eritrea",
      t("country.Estonia") => "country.Estonia" ,
      t("country.Ethiopia") => "country.Ethiopia",
      t("country.Falkland_Islands (Malvinas)") =>  "country.Falkland_Islands (Malvinas)"   ,
      t("country.Faroe_Islands") => "country.Faroe_Islands",
      t("country.Fiji") => "country.Fiji",
      t("country.Finland") => "country.Finland" ,
      t("country.France") => "country.France",
      t("country.French_Guiana") => "country.French_Guiana",
      t("country.Botswana") => "country.French_Polynesia",
      t("country.French_Southern_Territories") => "country.French_Southern_Territories",
      t("country.Gabon") => "country.Gabon" ,
      t("country.Gambia") => "country.Gambia",
      t("country.Georgia") => "country.Georgia",
      t("country.Germany") => "country.Germany",
      t("country.Ghana") => "country.Ghana",
      t("country.Gibraltar") => "country.Gibraltar",
      t("country.Greece") => "country.Greece",
      t("country.Greenland") =>  "country.Greenland",
      t("country.Grenada") => "country.Grenada",
      t("country.Guadeloupe") => "country.Guadeloupe",
      t("country.Guam") => "country.Guam" ,
      t("country.Guatemala") => "country.Guatemala",
      t("country.Guernsey") => "country.Guernsey",
      t("country.Guinea") => "country.Guinea",
      t("country.Guinea") => "country.Guinea-Bissau",
      t("country.Guyana") => "country.Guyana",
      t("country.Haiti") => "country.Haiti" ,
      t("country.Heard_and_McDonald_Islands") => "country.Heard_and_McDonald_Islands" ,
      t("country.Holy_See") =>  "country.Holy_See",
      t("country.Honduras") => "country.Honduras",
      t("country.Hong_Kong") => "country.Hong_Kong",
      t("country.Hungary") => "country.Hungary",
      t("country.Iceland") => "country.Iceland" ,
      t("country.India") => "country.India",
      t("country.Indonesia") => "country.Indonesia",
      t("country.Iran_Islamic_Republic_of") => "country.Iran_Islamic_Republic_of" ,
      t("country.Iraq") => "country.Iraq",
      t("country.Ireland") => "country.Ireland" ,
      t("country.Isle_of_Man") => "country.Isle_of_Man",
      t("country.Israel") => "country.Israel" ,
      t("country.Italy") =>  "country.Italy" ,
      t("country.Jamaica") => "country.Jamaica",
      t("country.Japan") => "country.Japan" ,
      t("country.Jersey") => "country.Jersey",
      t("country.Jordan") => "country.Jordan",
      t("country.Kazakhstan") => "country.Kazakhstan",
      t("country.Kenya") => "country.Kenya",
      t("country.Kiribati") => "country.Kiribati" ,
      t("country.Korea_Democratic_Peoples_Republic_of") => "country.Korea_Democratic_Peoples_Republic_of",
      t("country.Korea_Republic_of") => "country.Korea_Republic_of"  ,
      t("country.Kuwait") => "country.Kuwait",
      t("country.Kyrgyzstan") => "country.Kyrgyzstan" ,
      t("country.Lao_Peoples_Democratic_Republic") => "country.Lao_Peoples_Democratic_Republic" ,
      t("country.Latvia") => "country.Latvia",
      t("country.Lebanon") => "country.Lebanon",
      t("country.Lesotho") => "country.Lesotho" ,
      t("country.Liberia") => "country.Liberia",
      t("country.Libyan_Arab_Jamahiriya") =>  "country.Libyan_Arab_Jamahiriya" ,
      t("country.Liechtenstein") => "country.Liechtenstein",
      t("country.Lithuania") => "country.Lithuania" ,
      t("country.Luxembourg") =>  "country.Luxembourg",
      t("country.Macao") => "country.Macao",
      t("country.Macedonia_The_Former_Yugoslav_Republic_Of") => "country.Macedonia_The_Former_Yugoslav_Republic_Of" ,
      t("country.Madagascar") => "country.Madagascar",
      t("country.Malawi") => "country.Malawi",
      t("country.Malaysia") => "country.Malaysia",
      t("country.Maldives") =>  "country.Maldives" ,
      t("country.Mali") => "country.Mali" ,
      t("country.Malta") => "country.Malta",
      t("country.Marshall_Islands") => "country.Marshall_Islands",
      t("country.Martinique") => "country.Martinique",
      t("country.Mauritania") => "country.Mauritania",
      t("country.Mauritius") => "country.Mauritius" ,
      t("country.Mayotte") => "country.Mayotte",
      t("country.Mexico") => "country.Mexico" ,
      t("country.Micronesia_Federated_States_of") => "country.Micronesia_Federated_States_of" ,
      t("country.Moldova_Republic_of") => "country.Moldova_Republic_of",
      t("country.Monaco") => "country.Monaco",
      t("country.Mongolia") => "country.Mongolia",
      t("country.Montenegro") => "country.Montenegro",
      t("country.Montserrat") => "country.Montserrat",
      t("country.Morocco") => "country.Morocco",
      t("country.Mozambique") => "country.Mozambique",
      t("country.Myanmar") => "country.Myanmar",
      t("country.Namibia") => "country.Namibia",
      t("country.Nauru") => "country.Nauru",
      t("country.Nepal") => "country.Nepal",
      t("country.Netherlands") => "country.Netherlands",
      t("country.Netherlands_Antilles") => "country.Netherlands_Antilles",
      t("country.New_Caledonia") => "country.New_Caledonia" ,
      t("country.New_Zealand") => "country.New_Zealand",
      t("country.Nicaragua") => "country.Nicaragua" ,
      t("country.Niger") => "country.Niger",
      t("country.Nigeria") =>   "country.Nigeria",
      t("country.Niue") => "country.Niue",
      t("country.Norfolk_Island") =>  "country.Norfolk_Island",
      t("country.Northern_Mariana_Islands") =>  "country.Northern_Mariana_Islands" ,
      t("country.Norway") =>   "country.Norway" ,
      t("country.Oman") =>  "country.Oman",
      t("country.Pakistan") =>    "country.Pakistan",
      t("country.Palau") =>   "country.Palau",
      t("country.Palestinian_Territory_Occupied") => "country.Palestinian_Territory_Occupied",
      t("country.Panama") =>   "country.Panama" ,
      t("country.Papua_New_Guinea") => "country.Papua_New_Guinea" ,
      t("country.Paraguay") =>  "country.Paraguay",
      t("country.Peru") => "country.Peru",
      t("country.Philippines") => "country.Philippines",
      t("country.Pitcairn") => "country.Pitcairn" ,
      t("country.Poland") => "country.Poland",
      t("country.Portugal") =>   "country.Portugal",
      t("country.Puerto_Rico") => "country.Puerto_Rico",
      t("country.Qatar") => "country.Qatar",
      t("country.Reunion") =>  "country.Reunion",
      t("country.Romania") =>  "country.Romania" ,
      t("country.Russian_Federation") => "country.Russian_Federation",
      t("country.Rwanda") => "country.Rwanda" ,
      t("country.Saint_Barthelemy") =>  "country.Saint_Barthelemy",
      t("country.Saint_Helena") => "country.Saint_Helena",
      t("country.Saint_Kitts_and_Nevis") =>  "country.Saint_Kitts_and_Nevis",
      t("country.Saint_Lucia") => "country.Saint_Lucia" ,
      t("country.Saint_Pierre_and_Miquelon") => "country.Saint_Pierre_and_Miquelon",
      t("country.Saint_Vincent_and_the_Grenadines") => "country.Saint_Vincent_and_the_Grenadines",
      t("country.Samoa") => "country.Samoa" ,
      t("country.San_Marino") =>  "country.San_Marino",
      t("country.Sao_Tome_and_Principe") =>  "country.Sao_Tome_and_Principe",
      t("country.Saudi_Arabia") =>  "country.Saudi_Arabia",
      t("country.Senegal") =>    "country.Senegal",
      t("country.Serbia") =>   "country.Serbia" ,
      t("country.Seychelles") =>  "country.Seychelles" ,
      t("country.Sierra_Leone") =>    "country.Sierra_Leone",
      t("country.Singapore") =>    "country.Singapore",
      t("country.Slovakia") =>  "country.Slovakia",
      t("country.Slovenia") =>   "country.Slovenia" ,
      t("country.Solomon_Islands") =>   "country.Solomon_Islands" ,
      t("country.Somalia") =>   "country.Somalia",
      t("country.South_Africa") =>  "country.South_Africa" ,
      t("country.South_Georgia_and_the_South_Sandwich_Islands") =>  "country.South_Georgia_and_the_South_Sandwich_Islands" ,
      t("country.Spain") => "country.Spain",
      t("country.Sri_Lanka") => "country.Sri_Lanka",
      t("country.Sudan") =>   "country.Sudan",
      t("country.Suriname") => "country.Suriname",
      t("country.Svalbard_and_Jan_Mayen") => "country.Svalbard_and_Jan_Mayen",
      t("country.Swaziland") => "country.Swaziland",
      t("country.Sweden") => "country.Sweden",
      t("country.Switzerland") => "country.Switzerland" ,
      t("country.Syrian_Arab_Republic") =>  "country.Syrian_Arab_Republic",
      t("country.Taiwan") => "country.Taiwan",
      t("country.Tajikistan") => "country.Tajikistan" ,
      t("country.Tanzania_United_Republic_of") => "country.Tanzania_United_Republic_of" ,
      t("country.Thailand") =>  "country.Thailand",
      t("country.Timor-Leste") => "country.Timor-Leste" ,
      t("country.Togo") => "country.Togo",
      t("country.Tokelau") => "country.Tokelau" ,
      t("country.Tonga") => "country.Tonga" ,
      t("country.Trinidad_and_Tobago") => "country.Trinidad_and_Tobago",
      t("country.Tunisia") => "country.Tunisia",
      t("country.Turkey") => "country.Turkey",
      t("country.Turkmenistan") => "country.Turkmenistan",
      t("country.Turks_and_Caicos_Islands") => "country.Turks_and_Caicos_Islands",
      t("country.Tuvalu") => "country.Tuvalu" ,
      t("country.Uganda") => "country.Uganda",
      t("country.Ukraine") => "country.Ukraine",
      t("country.United_Arab_Emirates") => "country.United_Arab_Emirates",
      t("country.United_ Kingdom") => "country.United_ Kingdom",
      t("country.United_States") => "country.United_States",
      t("country.United_States_Minor_Outlying_Islands") => "country.United_States_Minor_Outlying_Islands",
      t("country.Uruguay") => "country.Uruguay" ,
      t("country.Uzbekistan") => "country.Uzbekistan",
      t("country.Vanuatu") => "country.Vanuatu" ,
      t("country.Venezuela") => "country.Venezuela",
      t("country.Viet_Nam") => "country.Viet_Nam" ,
      t("country.Virgin_Islands_British") => "country.Virgin_Islands_British",
      t("country.Virgin_IslandsUS") => "country.Virgin_IslandsUS",
      t("country.Wallis_and_Futuna") => "country.Wallis_and_Futuna",
      t("country.Western_Sahara") => "country.Western_Sahara",
      t("country.Yemen") => "country.Yemen",
      t("country.Zambia") => "country.Zambia",
      t("country.Zimbabwe") => "country.Zimbabwe"  }
      
      if extended
        h1 = {t("country.European_Union") => "country.European_Union" , t("country.Everywhere") => "country.Everywhere"  }
        @countries = @countries.merge(h1)
      end
      @countries.sort
  end
  
end
