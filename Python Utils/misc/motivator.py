from plyer import notification
import subprocess
from random import randint, choice
import time 

msg = [
    'pahinga ka naman uy😭',
    'batak ka mag code ah HAHAHAHAH',
    'baka ikaw na naman ang highest sa comprog nyan😔',
    'huy kanina ka pa dyan',
    'yayy gumana🥳 ata HAHAHAHA',
    'goodluck lods, kaya mo yan',
    'adik na na ata dyan😭😭'
    ]
msg += [
    'grabe ka, di ka na natulog? 😭',
    'parang wala nang bukas kung mag code ka',
    'legit idol ka na namin sa comprog',
    'ayun na, nagdebug na naman si master',
    'di ko na kaya, ikaw na lang magtuloy 😔',
    'solid, ang bilis mo mag gawa🔥',
    'tinatapos mo ba buong syllabus ngayong gabi? 😭',
    'sana all may braincells pa HAHAHA',
    'wag mo kami iwan sa finals lods🙏',
    'ikaw na talaga ang IT prodigy HAHAHA',
    'napuyat ka nanaman sa kakacode no',
    'di pa tapos pero mukhang gumagana na🥳',
    'pati weekend mo kinain na ng comprog 😔',
    'next level ka na, kami basic pa rin'
]

msg += [
    'ikaw na nga, di na kami sasali 😭',
    'may secret ka ba? bat ang galing mo HAHAHA',
    'di ka nagsasabi, nag full-stack ka na pala',
    'baka may sariling compiler ka na dyan HAHAHA',
    'pagod na kami, ikaw nagcocode pa rin 😔',
    'di ka na nagrereply, baka nasa matrix ka na',
    'pati bug natatakot sayo lods',
    'gawa ka na rin ng AI mo, kami na lang users mo',
    'baka may coding bloodline ka HAHAHA',
    'ikaw lang ata nag-eenjoy sa error messages 😭',
    'pagod na keyboard mo, ikaw hindi pa rin',
    'baka ikaw na rin gumawa ng syllabus HAHAHA'
]

msg += [
    'uy wag ka na tryhard, kami na lang magpuyat 😭',
    'ikaw na naman mabilis matapos, kami stuck pa rin HAHAHA',
    'grabe, parang wala ka nang ibang hobby kundi code',
    'di ka na nagrereply sa GC, baka nasa terminal ka pa rin',
    'ikaw na ang tunay na bug slayer🔥',
    'sige na, ikaw na highest ulit sa comprog 😔',
    'lods, wag mo kami iwan sa finals🙏',
    'di ka na nag-aaral, nagtatayo ka na ng startup',
    'next time ikaw na magturo, prof ka na eh'
]



size = 0
content = []

with open('counter.txt', 'a') as file:
    file.write('count\n')

with open('counter.txt', 'r') as file:
    for line in file:
        content.append(line.strip())

    size = len(content)
    
if size >= 5:
    with open('counter.txt', 'w') as f:
        f.write('')
    
    delay = randint(1, 30)
    time.sleep(delay)
    notification.notify(
        title='Leanne says( > ω < *):',
        message=choice(msg),
        timeout=5
    )