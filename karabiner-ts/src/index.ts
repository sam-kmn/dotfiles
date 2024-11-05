import
{
  layer,
  map,
  modifierLayer,
  NumberKeyValue,
  rule,
  withMapper,
  writeToProfile,
} from 'karabiner.ts'


writeToProfile('node', [

  rule('defaults')
    .manipulators([
      map('h', '⌘').toNone(),
    ]),

  rule('modifiers')
    .manipulators([
      map('›⇧')
        .toHyper()
        .toIfAlone('return_or_enter'),
      map('⇪')
        .to('delete_or_backspace')
    ]),

  layer('spacebar', 'navigation')
    .modifiers('??')
    .manipulators([
      map('n').to('←', '⌥⇧'),
      map('m').to('→', '⌥⇧'),
      map('w').to('fn', '⌃'),

      map('h').to('←'),
      map('j').to('↓'),
      map('k').to('↑'),
      map('l').to('→'),
    ]),

  layer('non_us_backslash', 'symbols')
    .manipulators([
      withMapper(['⌘', '⌥', '⌃', '⇧', '⇪'])
        ((key, index) => map((index + 1) as NumberKeyValue).toPaste(key)),

      withMapper(['←', '→', '↑', '↓', '␣', '⏎', '⌫', '⌦', '⇥', '⎋',])
        ((key) => map(key).toPaste(key)),

      map(',').toPaste('‹'),
      map('.').toPaste('›'),
    ]),
])
// modifierLayer('<⌥', 'v')
//   .description('Visual')
//   .notification('Visual')
//   .leaderMode()
//   .manipulators([
//     map('h').to('←', '<⌥⇧'),
//     map('j').to('↓', '<⌥⇧'),
//     map('k').to('↑', '<⌥⇧'),
//     map('l').to('→', '<⌥⇧'),
//   ]),
