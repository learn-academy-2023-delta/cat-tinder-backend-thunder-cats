thundercats = [
  {
    name: 'Panthro',
    age: 24,
    enjoys: 'Loves to lift weights and does not rerack the weights.',
    image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
  },
  {
    name: 'Cheetara',
    age: 36,
    enjoys: 'Loves catnip.',
    image: 'https://static.wikia.nocookie.net/thundercats/images/8/80/Cheetara.jpg/revision/latest?cb=20111219202357'
  },
  {
    name: 'Snarf',
    age: 19,
    enjoys: 'Enjoys the company of his friends while being a pessimist.',
    image: 'https://upload.wikimedia.org/wikipedia/en/thumb/b/bc/Screenshot_Snarf.jpg/220px-Screenshot_Snarf.jpg'
  },
  {
    name: 'Lion-O',
    age: 26,
    enjoys: 'Furrrrociously sleep and eat',
    image: 'https://static.wikia.nocookie.net/thundercats/images/c/c2/LionOFromThunderCats1985SeriesEpisodeTroubleWithTimeSc01.jpg/revision/latest?cb=20200331160007'
  },
  {
    name: 'WilyKit',
    age: 18,
    enjoys: 'Loves the outdoors and enjoys reading books that pertain to relationship advice.',
    image: 'https://i.pinimg.com/474x/dc/d6/11/dcd611ba4a2000d04dde7fa33b9fdc18.jpg'
  },
  {
    name: 'Pumyra',
    age: 30,
    enjoys: 'Passionate about becoming a Make-up Artist. Career driven, and does not like to waste time.',
    image: 'https://static.wikia.nocookie.net/thundercats/images/6/63/Pu3.jpg/revision/latest?cb=20161029195904'
  },
  {
    name: 'Tygra',
    age: 42,
    enjoys: 'Enjoys doing research on pharmaceuticals and building layouts for the city of CaTopia.',
    image: 'https://static.wikia.nocookie.net/thundercats/images/0/01/Tygra_2335.JPG/revision/latest?cb=20120604165827&path-prefix=pt-br'
  },
  {
    name: 'Jaga',
    age: 80,
    enjoys: 'Really fond of chess, bingo, long walks in the morning. Enjoys going to the park and feeding the pigeons.',
    image: 'https://static.wikia.nocookie.net/thundercats/images/7/70/Jaga.jpg/revision/latest?cb=20110916234238'
  },
  {
    name: 'Alluro',
    age: 56,
    enjoys: 'Really into astrology and loves going camping to look at the stars.',
    image: 'https://static.wikia.nocookie.net/thundercats/images/4/49/Cosmic_AL.jpg/revision/latest?cb=20100928150526'
  }
]

thundercats.each do |each_cat|
    Cat.create each_cat
    puts "creating thunder cat #{each_cat}"
  end