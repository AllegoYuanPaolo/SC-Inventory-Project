import random

messages = [
    'Kaya mo yan!',
    'Fighting!',
    'Galingan mo para maturuan mo si Leanne!',
    'Matutuwa si Leanne sayo pag magaling ka dyan!',
    'What if chat mo si Leanne? Kamustahin lang, ganun'
]

messages += [
    'Keep pushing, kahit dahan-dahan lang',
    'Small wins count, wag mo i-underestimate yan',
    'Focus muna sa step na nasa harap mo',
    'Good progress, tuloy mo lang🔥',
    'Pagod ka na? pahinga muna bago ulit grind',
    'Consistency lang, di kailangan perfect',
    'Solid effort, proud na ako sayo',
    'Konting tiyaga pa, matatapos din yan',
    'Trust the process, wag ka mainip',
    'Every run, dagdag experience yan 🙏',
    'Stay calm, mas malinaw pag relaxed ka',
    'Progress > perfection, tandaan mo yan',
    'Keep learning, kahit maliit na step',
    'Nice one, tuloy mo momentum mo 🥳',
    'Kaya mo yan, wag ka lang susuko 😔'
]

messages += [
    'Galingan mo para maturuan mo si Leanne!',
    'Matutuwa si Leanne sayo pag magaling ka dyan!',
    'What if chat mo si Leanne? Kamustahin lang, ganun',
    'Pag ikaw highest, si Leanne mismo mag congrats sayo 🥳',
    'Imagine mo si Leanne nagcheer habang nagcocode ka',
    'Pag consistent ka, baka si Leanne ma-inspire din',
    'Sige, ipakita mo skills mo para kay Leanne!',
    'Masaya si Leanne pag steady ka lang sa grind 😔',
    'Pag nagpresent ka, isipin mo si Leanne nakikinig',
    'Next time ikaw na groupmate ni Leanne, solid yun',
    'Pag tapos mo yan, flex mo kay Leanne HAHAHA',
    'Baka ikaw na maging coding partner ni Leanne 🙏',
    'Leanne will be impressed kung di ka tamarin ngayon',
    'Pag nagalingan ka dyan, ikaw na coach ni Leanne',
    'Imagine mo reaction ni Leanne pag nakita niya progress mo🔥'
]

messages += [
    'Okay lang, take it one step at a time.',
    'Small progress is still progress.',
    'Breathe muna, then continue when ready.',
    'Don’t rush, steady lang ang pacing.',
    'Good effort, keep it going.',
    'Rest if you need, then balik ulit.',
    'You’re learning, kahit mabagal okay lang.',
    'Stay calm, things will make sense eventually.',
    'Trust the process, wag ka mainip.',
    'Celebrate the small wins, they add up.',
    'Keep moving forward, kahit konti lang.',
    'Relax, you don’t need to be perfect.',
    'Consistency lang, di kailangan mabilis.',
    'You’re doing fine, tuloy mo lang.',
    'Progress > perfection, tandaan mo yan.'
]

messages += [
    'Pag ikaw highest, si Leanne tatawa lang HAHAHA',
    'Imagine mo si Leanne nagcheer habang nagcocode ka',
    'Sige, ipakita mo skills mo para kay Leanne!',
    'Pag consistent ka, baka si Leanne ma-inspire din 😔',
    'Flex mo progress mo, baka mapansin ni Leanne 🥳',
    'Leanne will be impressed kung steady ka lang',
    'Pag nagpresent ka, isipin mo si Leanne nakikinig',
    'Next time ikaw na groupmate ni Leanne, solid yun',
    'Pag tapos mo yan, libre ka na magyabang kay Leanne',
    'Baka ikaw na maging coding partner ni Leanne 🙏',
    'Leanne will notice kung di ka tamarin ngayon',
    'Pag nagalingan ka dyan, ikaw na coach ni Leanne',
    'Imagine mo reaction ni Leanne pag nakita niya progress mo🔥',
    'Masaya si Leanne pag consistent ka dyan',
    'What if ikaw na magturo kay Leanne next sem?'
]



msg = random.choice(messages)


print(f"\n{msg}")