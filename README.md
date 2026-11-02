# Osnove ekonomije za pravnike

[Radna mrežna inačica](https://lusiki.github.io/ekonomija-za-pravnike/) · [Prijelom za tisak](https://lusiki.github.io/ekonomija-za-pravnike/ekonomija-za-pravnike.pdf)

Knjiga prati autorov nacrt u osam dijelova, 21 poglavlju i tri dodatka. Prvi ogledni tekst i interaktivna vježba o najamninama nalaze se u odsjeku 2.2. Preostale su teme radni plan.

## Rad nakon predavanja

1. Snimku, prijepis s vremenskim oznakama i bilješke s ploče pohranite izvan javnog repozitorija. U radnoj tablici koristite interne oznake bez osobnih podataka.
2. U [tablici pokrivenosti](urednistvo/pokrivenost.tsv) pridružite dijelove predavanja odsjecima. Jedno predavanje može pripadati različitim poglavljima. Ako je tema izostala, označite treba li autorsku dopunu, izvor ili dodatno predavanje.
3. U pripadnom dokumentu u mapi poglavlja razvijte mehanizam kroz pitanje budućeg pravnika. Uvedite intuiciju prije formule i protumačite svaki graf. Za brojke navedite izvor i razdoblje, a za propis nadležnost, službeni izvor i datum provjere.
4. Nakon stručne i autorske provjere zamijenite natuknice gotovim tekstom i ažurirajte stanje u tablici. Za učenje uz AI odaberite samo javni nastavni tekst. Primjer u ucenje/najamnina.md zajednički je izvor za knjigu i mentorsku vježbu.
5. Nakon promjene modela usporedite prikaz u pregledniku s tablicom i statičkim grafom u PDF-u. Pri granici od 400 eura model treba dati manjak od 40 stanova, a pri granici od 800 eura manjak od nula stanova.

## Izgradnja

Instalirajte Quarto 1.9.38. Za uređivanje koristite `quarto preview --to html`. Naredba `quarto render --to all` izgrađuje mrežno izdanje i B5 PDF u mapi _book. Push na main pokreće izgradnju i objavu na GitHub Pages. Konačnu naslovnicu s hrptom pripremite nakon utvrđivanja tiskare i broja stranica.

## Urednički uzor

Iz [knjige Statistika](https://github.com/lusiki/statistika-knjiga/tree/e240baee664772257895ccd388672d65e25c3911) preuzeta su načela zajedničkog izvora za web i tisak, formata B5, statičkog para uz interaktivnu sliku, provjere empirijskih tvrdnji i zasebnog materijala za učenje uz AI. Ovaj projekt za PDF koristi Typst dostupan uz Quarto.
