import 'dart:math';

import 'package:walk_with_me/models/site.dart';

class BackendService {
  static Future<List> getSuggestions(String query) async {
    await Future.delayed(const Duration(seconds: 1));

    return List.generate(3, (index) {
      return {'name': query + index.toString(), 'price': Random().nextInt(100)};
    });
  }
}

class CitiesService {
  static final List<String> cities = ['Rome', 'Paris', 'London'];

  static List<String> getSuggestions(String query) {
    List<String> matches = [];
    if (query.isEmpty) {
      return matches;
    }
    matches.addAll(cities);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    if (matches.length > 3) {
      return matches.sublist(0, 4);
    }
    return matches;
  }
}

class SitesService {
  static final Map<String, List<Site>> citySites = {
    "Rome": [
      Site(
        imageUrl:
            'https://cdn.britannica.com/36/162636-050-932C5D49/Colosseum-Rome-Italy.jpg',
        name: 'Colosseum',
        category: ["Architecture", "History"],
        description:
            "The Colosseum is an oval amphitheatre in the centre of the "
            "city of Rome, Italy, just east of the Roman Forum. It is the largest "
            "ancient amphitheatre ever built, and is still the largest standing "
            "amphitheatre in the world today, despite its age. Construction began"
            " under the emperor Vespasian in 72 and was completed in 80 AD under his"
            " successor and heir, Titus. Further modifications were made during the "
            "reign of Domitian. The three emperors that were patrons of the work are"
            " known as the Flavian dynasty, and the amphitheatre was named the "
            "Flavian Amphitheatre by later classicists and archaeologists for its"
            " association with their family name. The Colosseum is built of "
            "travertine limestone, tuff, and brick-faced concrete. It could hold an "
            "estimated 50,000 to 80,000 spectators at various points in its history,"
            " having an average audience of some 65,000; it was used for gladiatorial"
            " contests and public spectacles including animal hunts, executions, "
            "re-enactments of famous battles, and dramas based on Roman mythology, "
            "and briefly mock sea battles. The building ceased to be used for "
            "entertainment in the early medieval era.",
      ),
      Site(
        imageUrl:
            'https://theculturetrip.com/wp-content/uploads/2016/10/trevi-flickr-benjamin-watson.jpg',
        name: 'Trevi Fountain',
        category: ["Architecture", "History"],
        description:
            "The Trevi Fountain is an 18th-century fountain in the Trevi district"
            " in Rome, Italy, designed by Italian architect Nicola Salvi and "
            "completed by Giuseppe Pannini and several others. Standing 26.3 "
            "metres high and 49.15 metres wide, it is the largest Baroque "
            "fountain in the city and one of the most famous fountains in "
            "the world. The fountain has appeared in several films, including "
            "Roman Holiday, Three Coins in the Fountain, Federico Fellini's "
            "classic La Dolce Vita, Sabrina Goes to Rome, and The Lizzie "
            "McGuire Movie. ",
      ),
      Site(
        imageUrl:
            'https://theculturetrip.com/wp-content/uploads/2016/10/trevi-flickr-benjamin-watson.jpg',
        name: 'St. Peter\'s Basilica',
        category: ["Architecture", "History", "Religious"],
        description:
            "The Papal Basilica of Saint Peter in the Vatican, or simply Saint "
            "Peter's Basilica, is a church built in the Renaissance style located"
            " in Vatican City, the papal enclave that is within the city of "
            "Rome, Italy. It was initially planned by Pope Nicholas V and then"
            " Pope Julius II to replace the aging Old St. Peter's Basilica, "
            "which was built in the fourth century by Roman emperor Constantine"
            " the Great. Construction of the present basilica began on 18 April"
            " 1506 and was completed on 18 November 1626. Designed principally "
            "by Donato Bramante, Michelangelo, Carlo Maderno and Gian Lorenzo "
            "Bernini, St. Peter's is the most renowned work of Renaissance "
            "architecture and the largest church in the world by interior "
            "measure. While it is neither the mother church of the Catholic "
            "Church nor the cathedral of the Diocese of Rome, St. Peter's is "
            "regarded as one of the holiest Catholic shrines. It has been "
            "described as \"holding a unique position in the Christian world\" "
            "and as \"the greatest of all churches of Christendom.\" Catholic "
            "tradition holds that the basilica is the burial site of Saint "
            "Peter, chief among Jesus's apostles and also the first Bishop"
            " of Rome.",
      ),
    ],
    "London": [
      Site(
        imageUrl:
            'https://planetofhotels.com/guide/sites/default/files/styles/paragraph__hero_banner__hb_image__1880bp/public/hero_banner/the-British-Museum.jpg',
        name: 'The British Museum',
        category: ["Museum", "History"],
        description:
            "The British Museum is a public museum dedicated to human history, "
            "art and culture located in the Bloomsbury area of London. Its "
            "permanent collection of eight million works is among the largest"
            " and most comprehensive in existence. It documents the story of "
            "human culture from its beginnings to the present. The British "
            "Museum was the first public national museum in the world. The "
            "Museum was established in 1753, largely based on the collections"
            " of the Anglo-Irish physician and scientist Sir Hans Sloane. It "
            "first opened to the public in 1759, in Montagu House, on the site"
            " of the current building. The museum's expansion over the "
            "following 250 years was largely a result of British colonisation"
            " and has resulted in the creation of several branch institutions,"
            " or independent spin-offs, the first being the Natural History "
            "Museum in 1881. In 1973, the British Library Act 1972 detached "
            "the library department from the British Museum, but it continued"
            " to host the now separated British Library in the same Reading "
            "Room and building as the museum until 1997",
      ),
      Site(
        imageUrl:
            'https://cdn.mos.cms.futurecdn.net/6d4cGxrZomXPyZVdpq8hdV-1200-80.jpg',
        name: 'Tower of London',
        category: ["Architecture", "History"],
        description:
            "The Tower of London, officially Her Majesty's Royal Palace and "
            "Fortress of the Tower of London, is a historic castle on the north"
            " bank of the River Thames in central London. It lies within the "
            "London Borough of Tower Hamlets, which is separated from the "
            "eastern edge of the square mile of the City of London by the open "
            "space known as Tower Hill. It was founded towards the end of 1066 "
            "as part of the Norman Conquest. The White Tower, which gives the "
            "entire castle its name, was built by William the Conqueror in 1078"
            " and was a resented symbol of oppression, inflicted upon London by"
            " the new ruling elite. The castle was also used as a prison from"
            " 1100 until 1952, although that was not its primary purpose. A "
            "grand palace early in its history, it served as a royal residence."
            " As a whole, the Tower is a complex of several buildings set "
            "within two concentric rings of defensive walls and a moat. There "
            "were several phases of expansion, mainly under kings Richard I, "
            "Henry III, and Edward I in the 12th and 13th centuries. The "
            "general layout established by the late 13th century remains "
            "despite later activity on the site. The Tower of London has "
            "played a prominent role in English history. ",
      ),
      Site(
          imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/b/b4/Buckingham_Palace%2C_London_-_April_2009.jpg',
          name: 'Buckingham Palace',
          category: ["Architecture", "History"],
          description:
              "Buckingham Palace is the London residence and administrative "
              "headquarters of the monarchy of the United Kingdom. Located in "
              "state occasions and royal hospitality. It has been a focal point"
              "the City of Westminster, the palace is often at the centre of "
              " for the British people at times of national rejoicing and "
              "mourning. Originally known as Buckingham House, the building "
              "at the core of today's palace was a large townhouse built for the"
              " Duke of Buckingham in 1703 on a site that had been in private "
              "ownership for at least 150 years. It was acquired by King George"
              " III in 1761 as a private residence for Queen Charlotte and "
              "became known as The Queen's House. During the 19th century it "
              "was enlarged, principally by architects John Nash and Edward "
              "Blore, who constructed three wings around a central courtyard. "
              "Buckingham Palace became the London residence of the British "
              "monarch on the accession of Queen Victoria in 1837."),
    ],
    "Paris": [
      Site(
        imageUrl:
            'https://thetourguy.com/wp-content/uploads/2020/01/eiffel-tower-day-700x420.jpg',
        name: 'Eiffel Tower',
        category: ["Architecture"],
        description:
            "The Eiffel Tower is a wrought-iron lattice tower on the Champ de "
            "Mars in Paris, France. It is named after the engineer Gustave Eiffel,"
            " whose company designed and built the tower. Locally nicknamed "
            "\"La dame de fer\", it was constructed from 1887 to 1889 as the"
            " centerpiece of the 1889 World's Fair and was initially criticised"
            " by some of France's leading artists and intellectuals for its "
            "design, but it has become a global cultural icon of France and "
            "one of the most recognisable structures in the world. The Eiffel"
            " Tower is the most visited monument with an entrance fee in the "
            "world; 6.91 million people ascended it in 2015. The Tower was "
            "made a Monument historique in 1964 and named part of UNESCO World"
            " Heritage Site in 1991. The tower is 330 metres tall, about the "
            "same height as an 81-storey building, and the tallest structure "
            "in Paris. Its base is square, measuring 125 metres on each side. "
            "During its construction, the Eiffel Tower surpassed the Washington"
            " Monument to become the tallest man-made structure in the world, a"
            " title it held for 41 years until the Chrysler Building in New "
            "York City was finished in 1930.",
      ),
      Site(
        imageUrl:
            'https://cdn.britannica.com/02/121002-050-92DB902F/Louvre-Museum-pyramid-Paris-Pei-IM.jpg',
        name: 'Louvre Museum',
        category: ["Museum"],
        description:
            "The Louvre, or the Louvre Museum, is the world's most-visited "
            "museum, and a historic landmark in Paris, France. It is the home "
            "of some of the best-known works of art, including the Mona Lisa "
            "and the Venus de Milo. A central landmark of the city, it is "
            "located on the Right Bank of the Seine in the city's 1st "
            "arrondissement. At any given point in time, approximately 38,000 "
            "objects from prehistory to the 21st century are being exhibited "
            "over an area of 72,735 square meters. Attendance in 2021 was 2.8 "
            "million due to the COVID-19 pandemic. The museum was closed for "
            "150 days in 2020, and attendance plunged by 72 percent to 2.7 "
            "million. Nonetheless, the Louvre still topped the list of "
            "most-visited art museums in the world in 2021. The museum is "
            "housed in the Louvre Palace, originally built in the late 12th "
            "to 13th century under Philip II. Remnants of the Medieval Louvre"
            " fortress are visible in the basement of the museum. Due to "
            "urban expansion, the fortress eventually lost its defensive "
            "function, and in 1546 Francis I converted it into the primary "
            "residence of the French Kings. The building was extended many "
            "times to form the present Louvre Palace.",
      ),
      Site(
        imageUrl:
            'https://www.planetware.com/photos-large/F/france-paris-notre-dame-cathedral.jpg',
        name: 'Cathédrale Notre-Dame de Paris',
        category: ["Museum"],
        description:
            "Notre-Dame de Paris, referred to simply as Notre-Dame, is a medieval"
            " Catholic cathedral on the Île de la Cité, in the 4th arrondissement"
            " of Paris. The cathedral, dedicated to the Virgin Mary, is "
            "considered one of the finest examples of French Gothic architecture."
            " Several of its attributes set it apart from the earlier Romanesque"
            " style, particularly its pioneering use of the rib vault and "
            "flying buttress, its enormous and colourful rose windows, and "
            "the naturalism and abundance of its sculptural decoration. Notre "
            "Dame also stands out for its musical components, notably its three"
            " pipe organs and its immense church bells. Construction of the "
            "cathedral began in 1163 under Bishop Maurice de Sully and was "
            "largely completed by 1260, though it was modified frequently in "
            "the centuries that followed. In the 1790s, during the French "
            "Revolution, Notre-Dame suffered extensive desecration; much "
            "of its religious imagery was damaged or destroyed. In the 19th "
            "century, the coronation of Napoleon I and the funerals of many of "
            "the French Republic's presidents took place at the cathedral",
      ),
    ]
  };

  static List<Site> getSitesByCity(String city) {
    List<Site> result = [];
    if (citySites.containsKey(city)) {
      result = citySites[city] as List<Site>;
    }
    return result;
  }

  static List<Site> getAllSites() {
    List<Site> result = [];
    citySites.forEach((key, _) {
      result.addAll(citySites[key] as List<Site>);
    });
    return result;
  }
}
