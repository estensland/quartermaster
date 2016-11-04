Gif.find_or_create_by(name: 'Why you fail', url: "http://i0.kym-cdn.com/photos/images/original/000/896/093/3b8.gif", active: true)
Gif.find_or_create_by(name: 'Head hit desk', url: "http://i1145.photobucket.com/albums/o503/KimmieRocks/head-desk-bartlett_zps7aadc009.gif", active: true)

top_shelf = Shelf.create(name: '1AAB')

  misc_binder = Binder.find_or_create_by(name: 'Misc Binder', color_hex: 'D4A190', shelf: top_shelf)
    to_file = Notebook.find_or_create_by(name: 'To File', description: '', color_hex: '6fceed', binder: misc_binder)
      top_lev = Divider.find_or_create_by(name: 'New Thoughts', description: '', parent: to_file)
  qm_binder = Binder.find_or_create_by(name: 'QM', color_hex: 'CC4433', shelf: top_shelf)
    fut = Notebook.find_or_create_by(name: 'Future', description: '', color_hex: '6fceed', binder: misc_binder)
      Divider.find_or_create_by(name: 'Bugs', description: '', parent: fut)
      Divider.find_or_create_by(name: 'New Features', description: '', parent: fut)


history_shelf = Shelf.create(name: 'History')
third_f_binder = Binder.find_or_create_by(name: 'Third Fitna', color_hex: '000000', shelf: history_shelf)
abbasids = Notebook.find_or_create_by(name: 'Abbasids', description: '', color_hex: '000000', binder: third_f_binder)
Divider.find_or_create_by(name: 'Forerunners', description: '', parent: abbasids)
Divider.find_or_create_by(name: 'Caliphs', description: '', parent: abbasids)
Divider.find_or_create_by(name: 'Family Members', description: '', parent: abbasids)

umayyads = Notebook.find_or_create_by(name: 'Umayyads', description: '', color_hex: 'FFFFFF', binder: third_f_binder)
Divider.find_or_create_by(name: 'Forerunners', description: '', parent: umayyads)
Divider.find_or_create_by(name: 'Mudari-Faction', description: '', parent: umayyads)
Divider.find_or_create_by(name: 'Yamani-Faction', description: '', parent: umayyads)



leguin_shelf = Shelf.create(name: 'LeGuin')
  earthsea = Binder.find_or_create_by(name: 'Earthsea', color_hex: '00FF00', shelf: leguin_shelf)
    Notebook.find_or_create_by(name: 'Works', description: '', binder: earthsea, color_hex: '666666')
    Notebook.find_or_create_by(name: 'Characters', description: '', binder: earthsea, color_hex: '666666')
    en= Notebook.find_or_create_by(name: 'Encyclopeida', description: '', binder: earthsea, color_hex: '666666')
      Divider.find_or_create_by(name: 'History', description: '', parent: en)
      Divider.find_or_create_by(name: 'Places', description: '', parent: en)
      Divider.find_or_create_by(name: 'Culture', description: '', parent: en)
      Divider.find_or_create_by(name: 'Magic', description: '', parent: en)
    Notebook.find_or_create_by(name: 'Series Analysis', description: '', binder: earthsea, color_hex: '666666')

  hannish = Binder.find_or_create_by(name: 'Hannish', color_hex: '55FF00', shelf: leguin_shelf)
    Notebook.find_or_create_by(name: 'Works', description: '', binder: hannish, color_hex: '666666')
    en= Notebook.find_or_create_by(name: 'Encyclopeida', description: '', binder: hannish, color_hex: '666666')
      Divider.find_or_create_by(name: 'Planets', description: '', parent: en)
      Divider.find_or_create_by(name: 'Races', description: '', parent: en)
      Divider.find_or_create_by(name: 'Technology/Abilities', description: '', parent: en)
    Notebook.find_or_create_by(name: 'Characters', description: '', binder: hannish, color_hex: '666666')
    Notebook.find_or_create_by(name: 'Series Analysis', description: '', binder: hannish, color_hex: '666666')

