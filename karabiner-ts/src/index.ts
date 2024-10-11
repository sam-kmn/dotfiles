import {
  FromKeyParam,
  ifApp,
  ifVar,
  layer,
  map,
  mapDoubleTap,
  NumberKeyValue,
  rule,
  simlayer,
  ToEvent,
  ToKeyCode,
  ToKeyParam,
  toPaste,
  withCondition,
  withMapper,
  withModifier,
  writeToProfile,
} from 'karabiner.ts'

// ! Change '--dry-run' to your Karabiner-Elements Profile name.
// (--dry-run print the config json into console)
// + Create a new profile if needed.
writeToProfile('node', [

  // rule('Caps Lock → Hyper').manipulators([
  // ]),

  rule('Defaults').manipulators([
    map('h', '⌘').toNone(),
    // map('r').toIfHeldDown('fn', '⌃')
  ]),

  layer('caps_lock', 'caps').manipulators([
    map('caps_lock').toHyper().toIfAlone('escape'),
    withMapper({
      h:'←',
      j:'↓',
      k:'↑',
      l:'→',
    } as const)
    ((key, value) => map(key).to(value)),
    // map('r').toIfHeldDown('fn', '⌃')
  ]),

  layer('spacebar', 'Space').manipulators([
    withMapper({
      h:'←',
      j:'↓',
      k:'↑',
      l:'→',
    } as const)
    ((key, value) => map(key).to(value)),

    map(';').to('return_or_enter'),
    map('g').to('left_command'),
  ]),


  layer('non_us_backslash', 'symbols').manipulators([
    withMapper(['⌘', '⌥', '⌃', '⇧', '⇪' ])
    ((key, index) => map((index + 1) as NumberKeyValue).toPaste(key)),

    withMapper(['←', '→', '↑', '↓', '␣', '⏎', '⌫', '⌦', '⇥', '⎋',])
    ((key) => map(key).toPaste(key)),

    map(',').toPaste('‹'), // left_{modifier}
    map('.').toPaste('›'), // ig ht_{modifier}
  ]),
])
