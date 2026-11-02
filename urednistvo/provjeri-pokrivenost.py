"""Provjeri odgovaraju li uredničke upute odsjecima u rukopisu."""
import csv
import re
from pathlib import Path

root = Path(__file__).resolve().parents[1]
editorial = root / "urednistvo"
register = (editorial / "izvori.md").read_text(encoding="utf-8")
source_keys = re.findall(r"^\d+\. \*\*([A-Z]+)\*\* ·", register, re.MULTILINE)
if not source_keys or len(source_keys) != len(set(source_keys)):
    raise SystemExit("Registar nema jedinstvene oznake izvora.")

sections = []
for chapter in sorted((root / "poglavlja").glob("*.qmd")):
    for chapter_number, section_number in re.findall(
        r"^## .+\{#tema-(\d+)-(\d+)\}$", chapter.read_text(encoding="utf-8"), re.MULTILINE
    ):
        sections.append(f"{chapter_number}.{section_number}")

with (editorial / "pokrivenost.tsv").open(encoding="utf-8", newline="") as table:
    rows = list(csv.DictReader(table, delimiter="\t"))
if [row["Odsjek"] for row in rows] != sections or len(set(sections)) != len(sections):
    raise SystemExit("Usporedite redoslijed i oznake odsjeka u rukopisu i tablici.")
for row in rows:
    keys = row["Javni izvori (oznake)"].split()
    if not keys or set(keys) - set(source_keys):
        raise SystemExit(f"Nepotpuna ili nepoznata uputa na izvor u odsjeku {row['Odsjek']}.")
    for field in ("Stanje", "Čitatelj već zna", "Zadatak za studenta", "Što još treba razjasniti", "Sljedeći korak"):
        if not (row.get(field) or "").strip():
            raise SystemExit(f"Odsjek {row['Odsjek']}: popunite rubriku „{field}”.")
print(f"Provjereno: {len(rows)} odsjeka i {len(source_keys)} izvora.")
