import
  {
    layer,
    map,
    NumberKeyValue,
    rule,
    withMapper,
    writeToProfile,
  } from 'karabiner.ts'


writeToProfile('node', [

  rule('disable defaults')
    .manipulators([
      map('h', '⌘').toNone(),
    ]),

  rule('straight map')
    .manipulators([
      map('caps_lock')
        .toHyper()
        .toIfAlone('return_or_enter'),
    ]),

  layer(';', 'semi_layer')
    .manipulators([
      map('w').to('fn', '⌃')
    ]),

  layer('spacebar', 'spacebar_layer')
    .modifiers('??')
    .manipulators([

      map('s').to('‹⇧'),
      map('d').to('‹⌃'),
      map('f').to('‹⌥'),
      map('g').to('‹⌘'),

      map('h').to('←'),
      map('j').to('↓'),
      map('k').to('↑'),
      map('l').to('→'),

      map(';').to('return_or_enter'),
      map('a').to('delete_or_backspace'),
    ]),

  layer('non_us_backslash', 'symbols_layer')
    .manipulators([
      withMapper(['⌘', '⌥', '⌃', '⇧', '⇪'])
        ((key, index) => map((index + 1) as NumberKeyValue).toPaste(key)),

      withMapper(['←', '→', '↑', '↓', '␣', '⏎', '⌫', '⌦', '⇥', '⎋',])
        ((key) => map(key).toPaste(key)),

      map(',').toPaste('‹'),
      map('.').toPaste('›'),
    ]),
])
