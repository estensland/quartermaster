Gif.find_or_create_by(name: 'Why you fail', url: "http://i0.kym-cdn.com/photos/images/original/000/896/093/3b8.gif", active: true)
Gif.find_or_create_by(name: 'Head hit desk', url: "http://i1145.photobucket.com/albums/o503/KimmieRocks/head-desk-bartlett_zps7aadc009.gif", active: true)

history_shelf = Shelf.create(name: 'History')
abbasid_binder = Binder.find_or_create_by(name: 'Abbasids', color_hex: '#4477FF', shelf: history_shelf)
crusades_binder = Binder.find_or_create_by(name: 'Crusades', color_hex: '#00FF00', shelf: history_shelf)

top_shelf = Shelf.create(name: '1AAB')

bindayr = Binder.find_or_create_by(name: 'Misc Binder', color_hex: '#D4A190', shelf: top_shelf)
Binder.find_or_create_by(name: 'Empty Binder', color_hex: '#CC4433', shelf: top_shelf)

Notebook.find_or_create_by(name: 'test', description: 'this...is a test....test.....test....test', color_hex: '6fceed', binder: bindayr)
noteymcnotersen = Notebook.find_or_create_by(name: 'Another Notebranched', description: 'Where we keep notes and junk', color_hex: '0AA7AB', binder: bindayr)
top_lev = Divider.find_or_create_by(name: 'Top Level Divider', description: 'This is the first of a few', parent: noteymcnotersen)
second_lev = Divider.find_or_create_by(name: 'Second Level Divider', description: 'This is the child of a few', parent: top_lev)
second_second_lev = Divider.find_or_create_by(name: 'Second Level Divider 2', description: 'This is the second child of a few', parent: top_lev)
third_lev = Divider.find_or_create_by(name: 'Third Level Divider', description: 'This is the grandchild child', parent: second_lev)
Divider.find_or_create_by(name: 'Top Level Divider 2', description: 'This is the second of a few', parent: noteymcnotersen)
